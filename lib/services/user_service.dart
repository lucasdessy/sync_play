import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sync_play/models/app_error.dart';
import 'package:sync_play/models/fire_user.dart';
import 'package:sync_play/services/app_service.dart';
import 'package:sync_play/services/route_service.dart';
import 'package:sync_play/ui/pages/auth/auth_bloc.dart';
import 'package:sync_play/ui/pages/home/home_bindings.dart';
import 'package:sync_play/ui/pages/register/register_bloc.dart';
import 'package:sync_play/util/single_instance_function.dart';

class UserService extends GetxService {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _messaging = FirebaseMessaging.instance;

  final Rx<User?> authUser = Rx<User?>();
  final Rx<FireUser?> currentUser = Rx<FireUser?>();
  final RxBool isLoggedin = RxBool();
  final RxBool loading = false.obs;

  final _appService = Get.find<AppService>();

  late final SingleInstanceFunction _loadUserSingle;
  @override
  void onInit() {
    _loadUserSingle = SingleInstanceFunction(() => _loadUser());
    super.onInit();
  }

  @override
  void onReady() {
    listenUser();
    super.onReady();
  }

  void setLoading(bool v) {
    loading.value = v;
  }

  Future<void> listenUser() async {
    await Future.delayed(Duration(seconds: 2));
    _auth.authStateChanges().listen((_user) {
      authUser.value = _user;
      if (_user == null) {
        print('it is not logged in');
        isLoggedin.value = false;
        HomePageBindings().destroy();
        _appService.key.currentState!
            .pushNamedAndRemoveUntil(RouteService.AUTH, (route) => false);
      } else {
        print('it is logged in');
        isLoggedin.value = true;
        AuthBindings().destroy();
        RegisterPageBindings().destroy();
        _appService.key.currentState!
            .pushNamedAndRemoveUntil(RouteService.HOME, (route) => false);
      }
      _loadUserSingle();
    });
  }

  Future<void> _loadUser() async {
    final _user = authUser();
    if (_user != null) {
      final snap = await _firestore.collection('users').doc(_user.uid).get();
      if (snap.exists) {
        print('_loadUser: loading existing user...');
        currentUser.value = FireUser.fromJson(snap.data());
        await _updateUserToken();
      } else {
        print('_loadUser: creating new user...');
        await _createUser(_user.uid);
        return _loadUser();
      }
    }
  }

  Future<void> _createUser(String userId) async {
    await _firestore.collection('users').doc(userId).set(FireUser().toJson());
  }

  Future<void> _updateUserToken() async {
    print('_updateUserToken: requesting notification permission');
    final _setting = await _messaging.requestPermission();
    if (_setting.authorizationStatus != AuthorizationStatus.denied) {
      print(
          '_updateUserToken: got notification permission... sending token to server');
      final _token = await _messaging.getToken();
      await updateUser(token: _token);
    }
  }

  Future<void> register(
      {required String email, required String password}) async {
    try {
      setLoading(true);
      await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
    } on FirebaseAuthException catch (e) {
      String? details;
      if (e.code == 'weak-password') {
        details = 'Sua senha ?? muito fraca';
      } else if (e.code == 'email-already-in-use') {
        details = 'Email j?? est?? em uso';
      }
      throw AppError('Erro ao registrar', errorDetails: details);
    } catch (e) {
      print(e);
      throw AppError('Ocorreu um erro interno');
    } finally {
      setLoading(false);
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      setLoading(true);
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
    } on FirebaseAuthException catch (e) {
      String? details;
      if (e.code == 'user-not-found') {
        details = 'Usu??rio n??o existe';
      } else if (e.code == 'wrong-password') {
        details = 'Senha est?? errada';
      }
      throw AppError('Erro ao fazer login', errorDetails: details);
    } catch (e) {
      print(e);
      throw AppError('Ocorreu um erro interno');
    } finally {
      setLoading(false);
    }
  }

  Future<void> logout() async {
    setLoading(true);
    print('logging out');
    await _auth.signOut();
    currentUser.value = null;
    setLoading(false);
  }

  Future<void> recoverPassword({required String email}) async {
    try {
      setLoading(true);
      await _auth.sendPasswordResetEmail(email: email.trim());
    } catch (e) {
      print(e);
      throw AppError('Ocorreu um erro interno');
    } finally {
      setLoading(false);
    }
  }

  Future<void> updateUser(
      {String? name, String? profilePicUrl, String? token}) async {
    try {
      setLoading(true);
      if (!(isLoggedin() ?? false)) {
        throw AppError('N??o ?? poss??vel editar informa????es',
            errorDetails: 'O usu??rio n??o est?? logado');
      }
      final _user = currentUser();
      _user!.name = name ?? _user.name;
      _user.profilePicUrl = profilePicUrl ?? _user.profilePicUrl;
      _user.token = token ?? _user.token;
      await _firestore
          .collection('users')
          .doc(authUser()!.uid)
          .update(_user.toJson());
      currentUser.value = _user;
      currentUser.refresh();
    } catch (e) {
      throw AppError('Ocorreu um erro interno');
    } finally {
      setLoading(false);
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sync_play/models/app_error.dart';

class AuthService extends GetxService {
  final _auth = FirebaseAuth.instance;
  final Rx<User> user = Rx<User>();
  final RxBool isLoggedin = RxBool();
  @override
  void onInit() {
    isLoggedin.value = _auth.currentUser != null;
    listenUser();
    super.onInit();
  }

  void listenUser() {
    _auth.authStateChanges().listen((_user) {
      user.value = _user;
      if (_user == null) {
        isLoggedin.value = false;
      } else {
        isLoggedin.value = true;
      }
    });
  }

  Future<void> login({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
    } on FirebaseAuthException catch (e) {
      String? details;
      if (e.code == 'user-not-found') {
        details = 'Usuário não existe';
      } else if (e.code == 'wrong-password') {
        details = 'Senha está errada';
      }
      throw AppError('Erro ao fazer login', errorDetails: details);
    } catch (e) {
      print(e);
      throw AppError('Ocorreu um erro interno');
    }
  }

  Future<void> recoverPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } catch (e) {
      print(e);
      throw AppError('Ocorreu um erro interno');
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }
}

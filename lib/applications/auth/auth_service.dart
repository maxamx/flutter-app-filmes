import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  User? user;
  void init() {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? _user) {
        if (_user == null) {
          user = _user;
          Get.offAllNamed('/login');
        } else {
          user = _user;
          Get.offAllNamed('/home');
        }
      },
    );
  }
}

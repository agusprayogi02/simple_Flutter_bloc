import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();

  User get user => _firebaseUser.value;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void signUp(String email, String pass) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: pass,
      );
    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signIn(String email, String pass) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: pass,
      );
    } catch (e) {
      Get.snackbar(
        "Error Login Account",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void logOut() async {
    try {
      await _auth.signOut();
      Get.back();
    } catch (e) {
      Get.snackbar(
        "Error logout Account",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

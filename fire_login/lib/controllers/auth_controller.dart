import 'package:fire_login/controllers/user_controller.dart';
import 'package:fire_login/models/user_model.dart';
import 'package:fire_login/services/database.dart';
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

  void signUp(String name, String email, String pass) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: pass,
      );
      UserModel user = UserModel(
        uid: _authResult.user.uid,
        name: name,
        email: _authResult.user.email,
      );
      if (await Database().createNewUser(user)) {
        Get.put<UserController>(UserController()).user = user;
        Get.back();
      }
      // Get.back();
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
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user.uid);
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

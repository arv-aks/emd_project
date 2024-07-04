import 'dart:async';

import 'package:emd_project/src/presentation/screens/auth/login_screen.dart';
import 'package:emd_project/src/presentation/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  Rx<User?> firebaseUser = null.obs;

  late Rx<GoogleSignInAccount?> googleSignInAccount;

  var isLoading = false.obs;

  User? get user => firebaseUser.value;

  @override
  void onInit() {
    super.onInit();

    firebaseUser = Rx<User?>(auth.currentUser);

    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSignIn.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      isLoading.value = false;
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

  //we can create repository for these methods.
  Future<bool> signInWithGoogle() async {
    bool isSignInSuccessful = false;
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);

        isLoading.value = true;

        await auth.signInWithCredential(authCredential).then((value) {
          isLoading.value = false;
          isSignInSuccessful = true;
        });
      }
    } catch (e) {
      print("exception: $e");
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }

    return isSignInSuccessful;
  }

  Future<void> logout() async {
    await auth.signOut();
    try {
      await googleSignIn.signOut();
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}

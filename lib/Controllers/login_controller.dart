// ignore_for_file: camel_case_types, unused_local_variable, avoid_function_literals_in_foreach_calls, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mid_level/main.dart';
import 'package:flutter_mid_level/view/home.dart';
import 'package:flutter_mid_level/view/login.dart';
import 'package:flutter_mid_level/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isValidEmail(String email) {
    final RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading(true);
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.text, password: password.text)
            .then((value) {
          isLoading(false);
          pref.setString('email', email.text);
          Get.offAll(() => const Home());
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          isLoading(false);
          showToast("No user connected with this email", context);
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          isLoading(false);
          showToast("Wrong Password", context);
          print('Wrong password provided for that user.');
        } else {
          isLoading(false);
          showToast("Email or Password Incorrect", context);
        }
      }
    }
  }

  ///
  ///
  
GoogleSignInAccount? googleUser;

  signInWithGoogle() async {
    googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth!.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      pref.setString('email', value.user!.email.toString());
      pref.setString('name', value.user!.displayName.toString());
      pref.setString('image_url',value.user!.photoURL.toString());
      print("================================================================");
      Get.to(()=>const Home());
    });

  }

  logout() async {
    googleUser = await GoogleSignIn().signOut();
    pref.clear();
   Get.offAll(()=>LoginScreen());
  }
}

// ignore_for_file: use_build_context_synchronously, camel_case_types, unrelated_type_equality_checks, non_constant_identifier_names, depend_on_referenced_packages, avoid_print, invalid_return_type_for_catch_error, unused_local_variable, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mid_level/view/login.dart';
import 'package:flutter_mid_level/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpController extends GetxController {
  var formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();
//////
  ///

  bool isValidEmail(String email) {
    final RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  storeUserData(BuildContext context, String id) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.add({
      'name': name.text,
      'email': email.text,
    }).then((value) async {
      print("User Added");
    }).catchError((error) => print("Failed to add user: $error"));
  }

  signUp(BuildContext context) async {
    var auth = FirebaseAuth.instance;
    if (formKey.currentState!.validate()) {
      print("*******************************************************0");
      try {
        final credential = await auth.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        print("done ////////////////////////////////");
        storeUserData(context, auth.currentUser!.uid);
        Get.to(() => LoginScreen());
        showToast("SignUp Success Login Now", context);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showToast("Weak Password", context);
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          showToast("Email Already Exist", context);
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
    update();
  }
}

import 'package:ecommerce_app/screens/loginScreen/login_screen.dart';
import 'package:ecommerce_app/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/services.dart';

class registerController extends GetxController {
  Services services = Services();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signup(context) async {
    try {
      UserCredential authenticationResult =
          await services.authentication.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      services.data.ref().child("Users").push().set(({'name':'${nameController.text}','email':'${emailController.text.trim()}','password':'${passwordController.text.trim()}'}));
      services.cloud.collection('Users').doc(CacheHelper.getDataToSharedPrefrence('token')).set({'name':'${nameController.text}','email':'${emailController.text.trim()}','password':'${passwordController.text.trim()}'});

      nameController.clear();
      emailController.clear();
      passwordController.clear();
      Get.to(loginScreen());
    }
    on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(
        content: Text(
          "${e.message}",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF0E40A3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

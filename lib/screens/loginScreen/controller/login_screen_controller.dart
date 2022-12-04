import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/services.dart';
import '../../../shared_pref.dart';
import '../../products_screen/products_screen.dart';

class loginController extends GetxController {
  Services services = Services();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading=false.obs;

  Future signin(context) async {
    try {
      UserCredential authenticationResult =
          await services.authentication.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      await CacheHelper.saveDataToSharedPrefrence(
          'token', authenticationResult.user!.uid);
      emailController.clear();
      passwordController.clear();
      Get.offAll(productsScreen());
    } on FirebaseAuthException catch (e) {
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

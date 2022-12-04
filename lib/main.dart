import 'package:ecommerce_app/screens/add_product_screen/add_product_screen.dart';
import 'package:ecommerce_app/screens/loginScreen/login_screen.dart';
import 'package:ecommerce_app/screens/products_screen/products_screen.dart';
import 'package:ecommerce_app/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.onInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginScreen(),
    );
  }
}
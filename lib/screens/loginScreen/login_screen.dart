import 'package:ecommerce_app/widgets/bottomtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/button.dart';
import '../../widgets/textfield.dart';
import '../signup_screen/register_screen.dart';
import 'controller/login_screen_controller.dart';

class loginScreen extends StatelessWidget {
  loginScreen({Key? key}) : super(key: key);
  loginController controller = Get.put(loginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 100),
                Icon(
                  Icons.shopping_basket,
                  size: 100,
                ),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20),
                customTextField(
                  label: 'Email Address:',
                  inputType: TextInputType.emailAddress,
                  controller: controller.emailController,
                ),
                customTextField(
                  label: 'Password:',
                  password: true,
                  inputType: TextInputType.text,
                  controller: controller.passwordController,
                ),
                customButton(
                  text: 'Sign In',
                  pressed: () {
                    controller.signin(context);
                  },
                ),
                customBottomText(
                  text1: "Don't have an account?",
                  text2: "Sign Up",
                  pressed: () {
                    Get.to(registerScreen());
                  },
                ),
              ],
            ),
          ),
        ),
    );
  }
}

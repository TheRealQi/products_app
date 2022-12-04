import 'package:ecommerce_app/widgets/bottomtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/button.dart';
import '../../widgets/textfield.dart';
import '../loginScreen/login_screen.dart';
import 'controller/register_screen_controller.dart';

class registerScreen extends StatelessWidget {
  registerScreen({Key? key}) : super(key: key);

  registerController controller = Get.put(registerController());
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
                'Sign Up',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              customTextField(
                label: 'Full Name:',
                inputType: TextInputType.emailAddress,
                controller: controller.nameController,
              ),
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
                text: 'Sign Up',
                pressed: () {
                  controller.signup(context);
                },
              ),
              customBottomText(
                text1: "Already have an account?",
                text2: "Sign In",
                pressed: () {
                  Get.to(loginScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:ecommerce_app/screens/products_screen/products_screen.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:ecommerce_app/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../widgets/appbar.dart';
import 'controller/add_product_screen_controller.dart';

class addProductScreen extends StatelessWidget {
  addProductScreen({Key? key}) : super(key: key);

  addProductController controller = Get.put(addProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        text: 'Add a Product',
        leadingpressed: (){
          Get.to(productsScreen());
          controller.productNameController.clear();
          controller.productPriceController.clear();
          controller.productDescriptionController.clear();
          controller.productCategoryController.clear();
        },
        leadingicon: Icons.arrow_back_rounded,
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          children: [
            customTextField(
                inputType: TextInputType.text,
                label: "Product Name:",
                controller: controller.productNameController,
            ),
            customTextField(
              inputType: TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              label: "Product Price:",
              controller: controller.productPriceController,
            ),
            customTextField(
              inputType: TextInputType.text,
              label: "Product Description:",
              controller: controller.productDescriptionController,
            ),
            customTextField(
              inputType: TextInputType.text,
              label: "Product Category:",
              controller: controller.productCategoryController,
            ),
            customButton(
                text: "Add Product (Cloud Firestore)",
                pressed: (){
                  controller.addProductToCloud(context);
                },
            ),
            customButton(
              text: "Add Product (Realtime Database)",
              pressed: (){
                controller.addProductToRTDB(context);
              },
            )
          ],
        ),
      ),
    );
  }
}


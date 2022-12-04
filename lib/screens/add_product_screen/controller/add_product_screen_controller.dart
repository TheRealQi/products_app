import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../services/services.dart';
import '../../../shared_pref.dart';

class addProductController extends GetxController {
  Services services = Services();

  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productCategoryController = TextEditingController();

  Future addProductToRTDB(context) async {
    try {
      services.data.reference().child("Products").push().set(({'Product Name':'${productNameController.text}','Product Price':'${productPriceController.text.trim()}','Product Description':'${productDescriptionController.text.trim()}','Product Category':'${productCategoryController.text.trim()}'}));
    } catch (e) {
      print(e);
    }
  }
  Future addProductToCloud(context) async {
    try {
      FirebaseFirestore.instance.collection('Products').add({'Product Name':'${productNameController.text}','Product Price':'${productPriceController.text.trim()}','Product Description':'${productDescriptionController.text.trim()}','Product Category':'${productCategoryController.text.trim()}'});
    } catch (e) {
      print(e);
    }
  }
}
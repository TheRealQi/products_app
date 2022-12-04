import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/screens/add_product_screen/add_product_screen.dart';
import 'package:ecommerce_app/screens/loginScreen/login_screen.dart';
import 'package:ecommerce_app/shared_pref.dart';
import 'package:ecommerce_app/widgets/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class productsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: customAppBar(
        text: 'Products',
        leadingpressed: () {
          Get.offAll(loginScreen());
        },
        leadingicon: Icons.logout_rounded,
        actionpressed: () {
          Get.to(addProductScreen());
        },
        actionicon: Icons.add_circle_outline_rounded,
      ),
      body: Center(
        child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('Products').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                children: snapshot.data!.docs.map((document) {
                  return Center(
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: double.infinity,
                        height: 100,
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 75,
                                    height:75,
                                    child:
                                    Icon(Icons.production_quantity_limits, size: 50),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(document['Product Name'],
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Text('Price: '+document['Product Price']+' EGP',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Text(document['Product Category'],
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }),
      ),
    );
  }
}

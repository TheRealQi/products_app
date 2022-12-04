import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customTextField extends StatelessWidget{
  final TextInputType? inputType;
  final bool password;
  final String? label;
  final TextEditingController? controller;

  customTextField({required this.inputType, required this.label, this.password = false, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 23,vertical: 5),
          child:
          Text(
            "$label",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 47,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFE1E6F1),
          ),
          child: Column(
              children: [
              Expanded(
                child:
                TextFormField(
                  obscureText: password,
                  keyboardType: inputType,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: const EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 10,
                      right: 5,
                    ),
                  ),
                  controller: controller,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
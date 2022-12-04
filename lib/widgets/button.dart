import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class customButton extends StatelessWidget{
  final String text;
  final VoidCallback? pressed;
  customButton({required this.text, required this.pressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      height: 47,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: pressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Color(0xFF0E40A3)),
        ),
        child: Container (
          child:
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFFFFFFFF),
              ),
            ),
        ),
      ),
    );
  }
}
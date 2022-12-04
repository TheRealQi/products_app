import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customBottomText extends StatelessWidget {
  final String? text1;
  final String? text2;
  final VoidCallback? pressed;
  const customBottomText({required this.text1,required this.text2,required this.pressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: TextButton(
        onPressed: pressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("$text1",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              )
            ),
            SizedBox(width: 10),
            Text("$text2",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF0E40A3),
                )
            ),
          ],
        ),
      ),
    );
  }
}
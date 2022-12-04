import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget implements PreferredSizeWidget {
  const customAppBar({
    Key? key, required this.text, this.leadingpressed, this.leadingicon, this.actionpressed, this.actionicon}) : super(key: key);

  final String text;
  final VoidCallback? leadingpressed;
  final IconData? leadingicon;
  final VoidCallback? actionpressed;
  final IconData? actionicon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 70,
      title: Text("$text"),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
          color: Color(0xFF0E40A3),
        ),
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
              onPressed: leadingpressed,
              icon: Icon(leadingicon),
          );
        },
      ),
      actions: [
        IconButton(
            onPressed: actionpressed,
            icon: Icon(actionicon),
        )
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(70);
}

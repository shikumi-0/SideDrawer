import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  DrawerItem({this.icon, this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36, vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              icon,
              size: 25,
              color: Color(0xffADEFD1),
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              title,
              style: TextStyle(color: Color(0xffADEFD1), fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}

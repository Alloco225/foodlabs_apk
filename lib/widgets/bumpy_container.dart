import 'package:flutter/material.dart';

class ABumpyContainer extends StatelessWidget {
  final Function onTap;
  final double size;
  final IconData icon; // TODO make img
  final Color color;
  final Color textColor;
  final String text;

  const ABumpyContainer({
    @required this.onTap,
    // this.size = 70,
    this.size = 55,
    @required this.icon,
    this.color = Colors.white,
    this.textColor = Colors.white,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: [
            // Icon Image Container
            Container(
              height: size,
              // width: size,
              width: size + 15,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              // Image or Icon
              child: Icon(
                icon,
              ),
            ), // Text
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                // color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}

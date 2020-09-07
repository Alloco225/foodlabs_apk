import 'package:flutter/material.dart';

class AExpandedContainer extends StatelessWidget {
  final Widget child;
  final double radius;
  final Color color;
  final EdgeInsets padding;
  final EdgeInsets margin;
  // const AExpandedContainer({Key key}) : super(key: key);
  AExpandedContainer({
    @required this.child,
    this.radius = 5,
    this.color = Colors.white,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        margin: margin ?? EdgeInsets.all(5),
        padding: padding ?? EdgeInsets.all(10),
        child: child,
      ),
    );
  }
}

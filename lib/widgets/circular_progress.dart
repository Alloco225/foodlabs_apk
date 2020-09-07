import 'package:flutter/material.dart';

class ACircularProgress extends StatelessWidget {
  final Widget child;
  final double size;
  final Animation<Color> valueColor;
  final AssetImage backgroundImage;
  final Color backgroundColor;
  final EdgeInsets padding;


  ACircularProgress({
    this.child,
    this.backgroundImage,
    this.valueColor,
    this.backgroundColor,
    this.size = 100,
    this.padding,
  });
  // const ACircularProgress({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: size,
        width: size,
        child: Stack(
          children: [
            Positioned.fill(
              child: CircularProgressIndicator(
                valueColor: valueColor ?? null,
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: padding ?? EdgeInsets.all(2),
                child: CircleAvatar(
                  child: child ?? Container(),
                  backgroundImage: backgroundImage ?? null,
                  backgroundColor: backgroundColor ?? Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

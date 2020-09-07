import 'package:flutter/material.dart';

class ALoader extends StatelessWidget {
  final Widget child;
  final double size;
  final Animation<Color> valueColor;
  final AssetImage backgroundImage;
  final Color backgroundColor;
  final EdgeInsets padding;
  // final Text text;
  final String text;

  ALoader({
    this.child,
    this.backgroundImage,
    this.text,
    this.valueColor,
    this.backgroundColor,
    this.size = 100,
    this.padding,
  });
  // const ALoaderr({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: size+30,
        child: Column(
          children: [
            Container(
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
                      padding: padding ?? EdgeInsets.all(10),
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
            // 
            SizedBox(height: 5),
            Container(child: Text(text?? ""),),
          ],
        ),
      ),
    );
  }
}

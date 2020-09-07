import 'package:flutter/material.dart';


class AContainer404 extends StatelessWidget {
  const AContainer404({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            children: [
              Image.asset("images/404.png"),
              SizedBox(height: 10),
              Text(
                "Wow, Such Empty",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Theme.of(context).disabledColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodlabs/screens/nav_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodLabs',
      theme: ThemeData(
        // primarySwatch: Colors.deepOrange,
        primaryColor: Colors.deepOrange,
        primaryColorDark: Colors.deepOrange[900],
        accentColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          
        ),
      ),
      home: MainScreen(),
    );
  }
}

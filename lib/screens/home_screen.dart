import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FoodLabs"),
        leading: IconButton(
          icon: Icon(Icons.person_outline_rounded),
          onPressed: () {

          },
        ),
      ),
      body: Container(
        child: Column(children: [
          Expanded(child: Container()),
          Expanded(child: Container(),)
        ],),
      ),
    );
  }
}

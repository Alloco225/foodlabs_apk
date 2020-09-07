import 'package:flutter/material.dart';
import 'package:foodlabs/screens/pantry_screen.dart';
import 'package:foodlabs/widgets/amane_loader.dart';

class MainScreen3 extends StatefulWidget {
  @override
  _MainScreen3State createState() => _MainScreen3State();
}

class _MainScreen3State extends State<MainScreen3> {
  // Current Tab Index
  var index = 0;
  List pageTabs = [
    PantryScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  // TextEditingController _inputController;
  // TextEditingController _outputController;
  //
  bool _isLoading = true;

  // **** DATA FETCHING

  @override
  Widget build(BuildContext context) {
    //
    // Big Ass Main Container
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              // Main Content
              Container(
                // color: Theme.of(context).primaryColor,
                color: Colors.white,
                child: pageTabs[index],
              ),
              
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: buildBottomNavBar(context),
              ),
            ],
          ),
        ),
      
    );
  }

  // Custom Bottom bar
  Container buildBottomNavBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0, color: Colors.grey),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Single Button Main
          _BottomNavBarButton(
            index: index,
            thisIndex: 0,
            icon: Icons.food_bank,
            text: "Pantry",
            onTap: () {
              // goto or Stay on the home page
              if (index != 0) {
                setState(() {
                  index = 0;
                });
              }
            },
          ),
          // Single Button History
          _BottomNavBarButton(
            index: index,
            thisIndex: 1,
            icon: Icons.home,
            // text: "Recouvrements",
            text: "Menu",
            onTap: () {
              // goto or Stay on the home page
              if (index != 1) {
                setState(() {
                  index = 1;
                });
              }
            },
          ),

          //
          _BottomNavBarButton(
            index: index,
            thisIndex: 2,
            icon: Icons.favorite,
            text: "Favorites",
            onTap: () {
              if (index != 2) {
                setState(() {
                  index = 2;
                });
              }
            },
          ),
          _BottomNavBarButton(
            index: index,
            thisIndex: 3,
            icon: Icons.shopping_cart,
            text: "Shoping list",
            onTap: () {
              if (index != 3) {
                setState(() {
                  index = 3;
                });
              }
            },
          ),
          //
          _BottomNavBarButton(
            index: index,
            thisIndex: 4,
            icon: Icons.account_circle,
            text: "Compte",
            onTap: () {
              if (index != 4) {
                setState(() {
                  index = 4;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

class _BottomNavBarButton extends StatelessWidget {
  final int index;
  final int thisIndex;
  final IconData icon;
  final String text;
  final Function onTap;

  _BottomNavBarButton(
      {this.index, this.thisIndex, this.icon, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    bool _isSelected = thisIndex == index;

    return InkWell(
      // TODO make it fancier
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              size: 30,
              // color: colorFromIndex(thisIndex),
              color: _isSelected ? Colors.white : Colors.grey,
            ),
            SizedBox(width: 3),
            if (_isSelected)
              Text(
                text,
                style: TextStyle(
                  // color: colorFromIndex(thisIndex),
                  color: _isSelected ? Colors.white : Colors.grey,
                ),
              ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}

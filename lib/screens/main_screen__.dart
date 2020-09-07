import 'package:flutter/material.dart';
import 'package:foodlabs/widgets/amane_loader.dart';

class MainScreen2 extends StatefulWidget {
  @override
  _MainScreen2State createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {
  // Current Tab Index
  var index = 0;
  List pageTabs;

  // Theming
  // var backgroundColor = appSecondary300;
  // var homeTabBackgroundColor = appSecondary600;

  // TextEditingController _inputController;
  // TextEditingController _outputController;
  //
  bool _isLoading = true;
  //
  int _loadingStringIndex = 0;
  List<String> _loadingStrings = [
    "Connexion au serveur..",
    "Recherche des commercants..",
    "Téléchargement de la carte..",
    "Chargement de votre profil..",
    "Lancement de l'interface..",
  ];
  void nextString() {
    if (_loadingStringIndex < _loadingStrings.length) {
      Future.delayed(Duration(milliseconds: 300)).then((value) => setState(() {
            _loadingStringIndex++;
          }));
    }
  }

  // List<Bundle> bundles = [];
  // **** LOCAL LOADED DATA

  @override
  initState() {
    super.initState();
    // this._inputController = new TextEditingController();
    // this._outputController = new TextEditingController();
    // nextString(); //
    pageTabs = [
      // Main
      // HomeTab(widget.agent),
      // HistoryTab(widget.agent, _recoveries),
      // MapTab(widget.agent, _merchantsMarkers),
      // MerchantsTab(),
      // UserProfileTab(widget.agent),

      // TODO
      // ! hide bottom tab after delay
    ];
    nextString(); //
    setupPageTabs();

    //
    // fetch Bundles
    // Page Tabs
    // loadMarkers();
  }

  // **** Set up page tabs
  setupPageTabs() async {
    // await loadRecoveries();
    nextString(); //
    await loadMarkers();
    nextString(); //

    pageTabs = [
      // Main
      // HomeTab(widget.agent),
      // HistoryTab(widget.agent, _recoveries),
      // MapTab(widget.agent, _merchantsMarkers),
      // MerchantsTab(),
      // UserProfileTab(widget.agent),
      Container(),
      Container(),
      Container(),
      Container(),
      Container(),

      // TODO
      // ! hide bottom tab after delay
    ];
    nextString();

    setState(() {
      _isLoading = false;
    });
  }

  // **** DATA FETCHING
  // *** Recoveries
  // loadRecoveries() async {
  //   print(">>>>>>> Loading Recoveries darta for view");
  //   _recoveries =
  //       await Provider.of<Recoveries>(context, listen: false).fetchAll();
  //   print(">>>>>>> Loaded Recoveries data for view");
  // }

  // *** Markers
  loadMarkers() async {
    print(">>>>>>> Loaded Mergent Markers data for view");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    int newIndex = ModalRoute.of(context).settings.arguments as int;
    if (newIndex != null) {
      index = newIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    //
    // Big Ass Main Container
    return Scaffold(
      body: SafeArea(
        child: Container(
          //
          // height: MediaQuery.of(context).size.height,
          // color: appPrimary300,
          // TODO decide on a theme
          color: Colors.blue,
          child: Stack(
            children: [
              // Main Content
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: 200,
                  child: Text("DMdkf"),
                ),
              ),
              Expanded(
                child: pageTabs[index],
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInSine,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: 200+200.0+200,
                  child: Text("DMdkf"),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInSine,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: 200+200.0,
                  child: Text("DMdkf"),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInSine,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: 200,
                  child: Text("DMdkf"),
                ),
              ),
              // Bottom NavBar
              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: buildBottomNavBar(context),
              ),
            ],
          ),
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
        border: Border.all(width: 0, color: Colors.white),
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
            text: "Accueil",
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

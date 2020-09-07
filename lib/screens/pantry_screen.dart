import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodlabs/models/data.dart';
import 'package:foodlabs/utils/app_colors.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import '';

class PantryScreen extends StatefulWidget {
  PantryScreen({Key key}) : super(key: key);

  @override
  _PantryScreenState createState() => _PantryScreenState();
}

class _PantryScreenState extends State<PantryScreen> {
  //
  // preferences
  bool _areOrdered = false;

  TextEditingController _ingredientsController = TextEditingController();
  //
  List<String> _selectedIngredients = [];
  //
  List<String> _searchResults = [];
  bool _isSearchResultsExpanded = false;

  // Category ingredients
  final List<Map<String, dynamic>> loadedCategoriesIngredients =
      DATA['categoryIngredients'];
      
  List<String> allIngredients = [];

  List<Map<String, dynamic>> categoriesIngredients = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      categoriesIngredients = loadedCategoriesIngredients;
    });
    for (var cc = 0; cc < loadedCategoriesIngredients.length; cc++) {
      var category = loadedCategoriesIngredients[cc];
      for (var ii = 0; ii < category['ingredients'].length; ii++) {
        var ingredient = category['ingredients'][ii];
        if (!allIngredients.contains(ingredient)) {
          allIngredients.add(ingredient);
        }
      }
    }
    allIngredients.sort();
    print(">>>>>> all ingredients ==");
    print(allIngredients);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _ingredientsController.dispose();
  }

  void _toggleSelectIngredient(String ingredient) {
    if (_selectedIngredients.contains(ingredient)) {
      setState(() {
        _selectedIngredients.remove(ingredient);
      });
    } else {
      setState(() {
        _selectedIngredients.add(ingredient);
      });
    }
  }

  void _emptySelectedIngredients() {
    setState(() {
      _selectedIngredients = [];
    });
  }

  void searchIngredients(String query) {
    _searchResults = [];
    List<String> queryList = query.split(" ");

    // todo split with , ; \n \t
    print(queryList);

    for (String queryIngredient in queryList) {
      if (queryIngredient.length > 1) {
        print(queryIngredient);
        print(">>>>>");
        setState(() {
          _searchResults += (allIngredients
              .where((element) => element.startsWith(queryIngredient))
              .toList());
          _isSearchResultsExpanded = true;
        });
      }
    }
    //
  }

  bool _isIngredientSelected(String ingredient) {
    return _selectedIngredients.contains(ingredient);
  }

  String _selectedIngredientsInCategory(String category) {
    var count = 0;
    var ingredients = categoriesIngredients
        .firstWhere((e) => e['category'] == category)['ingredients'];
    for (var selected in _selectedIngredients) {
      for (var ingredient in ingredients) {
        if (selected == ingredient) count++;
      }
    }
    return "$count/${ingredients.length} Ingredients";
  }

  void _addIngredient(String ingredient) {
    if (!_selectedIngredients.contains(ingredient))
      setState(() {
        _selectedIngredients.add(ingredient);
      });
  }

  void _removeIngredient(String ingredient) {
    if (!_selectedIngredients.contains(ingredient))
      setState(() {
        _selectedIngredients.remove(ingredient);
      });
  }

  void _copyIngredientsToClipboard() async {
    // Clipboard.setData(ClipboardData(text: ""));

    String data = _selectedIngredients
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll(',', "\n");
    // _selectedIngredients.forEach((ingredient) {
    //   data +=  "\n"+ ingredient;
    //   print(">>> copying");
    //   print(data);
    // });
    print("<<<<<<<<< copied data");
    print(data);
    await Clipboard.setData(ClipboardData(text: data)).then((value) {
      final snackBar = SnackBar(
        content: Text('Copied to Clipboard'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  void _toggleOrder() {
    if (_areOrdered) {
      setState(() {
        categoriesIngredients = loadedCategoriesIngredients;
        _areOrdered = false;
        print("unordered categoriesIngredients");
        print(categoriesIngredients);
      });
    } else {
      setState(() {
        categoriesIngredients.forEach((cat) {
          cat['ingredients'].sort();
        });
        _areOrdered = true;
      });
    }
  }

  //
  List expandedCategoryWidgets = [];
  void expandCategoryWidget(String category) {
    if (expandedCategoryWidgets.contains(category)) {
      setState(() {
        expandedCategoryWidgets.remove(category);
      });
    } else {
      setState(() {
        expandedCategoryWidgets.add(category);
      });
    }
  }

  bool isCategoryWidgetExpanded(String category) {
    return expandedCategoryWidgets.contains(category);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          // color: Theme.of(context).primaryColor,
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // ********* APPBAR
            buildAppBar(),
            // ********* SEARCH BAR
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                child: TextField(
                  // minLines: 1,
                  // TODO
                  controller: _ingredientsController,
                  onTap: () {
                    //
                  },
                  onChanged: (_) {
                    if (_.length > 2) {
                      searchIngredients(_);
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      focusColor: Theme.of(context).accentColor,
                      alignLabelWithHint: false,
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                        // borderSide: BorderSide(color: Colors.white, width: 1),
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Add/Remove/Paste ingredients"),
                ),
              ),
            ),
            // ********* search results

            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInSine,
              height: _isSearchResultsExpanded
                  ? _searchResults.length > 1 ? 100 : 50
                  : 0,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ..._searchResults
                        .map(
                          (result) => ListTile(
                            visualDensity: VisualDensity.compact,
                            title: Text(
                              "$result",
                              style: TextStyle(
                                color: _isIngredientSelected(result)
                                    ? Theme.of(context).accentColor
                                    : Colors.black,
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                _isIngredientSelected(result)
                                    ? Icons.remove
                                    : Icons.add,
                                color: _isIngredientSelected(result)
                                    ? Colors.red
                                    : Colors.green,
                                // add/remove
                              ),
                              onPressed: () {
                                // TODO add/remove
                                _toggleSelectIngredient(result);
                                setState(() {
                                  _searchResults.remove(result);
                                  if (_searchResults.isEmpty) {
                                    _isSearchResultsExpanded = false;
                                  }
                                });
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
            // *********** BODY
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    // Free Space
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // *********** Voice Container
                          buildVoiceInput(context),
                          // ********** Ingredients List
                          ...categoriesIngredients
                              .map((cat) => Card(
                                    child: Container(
                                      width: double.infinity,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            visualDensity:
                                                VisualDensity.compact,
                                            leading: CircleAvatar(
                                              backgroundColor:
                                                  Theme.of(context).accentColor,
                                              child: Image.asset(
                                                "images/logo.png",
                                              ),
                                            ),
                                            title: Text("${cat['category']}"),
                                            subtitle: Text(
                                                _selectedIngredientsInCategory(
                                                    cat['category'])),
                                            trailing: IconButton(
                                              icon: Icon(
                                                  isCategoryWidgetExpanded(
                                                          cat['category'])
                                                      ? Icons.keyboard_arrow_up
                                                      : Icons
                                                          .keyboard_arrow_down),
                                              onPressed: () {
                                                // TODO done show more category item
                                                expandCategoryWidget(
                                                    cat['category']);
                                              },
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.2,
                                          ),
                                          // Igredient list
                                          Container(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Wrap(
                                              direction: Axis.horizontal,
                                              alignment: WrapAlignment.start,
                                              children: [
                                                // TODO fix length to dynamic
                                                for (var yy = 0; yy < 5; yy++)
                                                  Card(
                                                    color: _isIngredientSelected(
                                                            cat['ingredients']
                                                                [yy])
                                                        ? Theme.of(context)
                                                            .accentColor
                                                        : Colors.white,
                                                    child: InkWell(
                                                      onTap: () {
                                                        // TODO select ingredient
                                                        _toggleSelectIngredient(
                                                            cat['ingredients']
                                                                [yy]);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          "${cat['ingredients'][yy]}",
                                                          style: TextStyle(
                                                            color: _isIngredientSelected(
                                                                    cat['ingredients']
                                                                        [yy])
                                                                ? Colors.white
                                                                : Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (!isCategoryWidgetExpanded(
                                                    cat['category']))
                                                  Card(
                                                    child: InkWell(
                                                      onTap: () {
                                                        expandCategoryWidget(
                                                            cat['category']);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                            "+${cat['ingredients'].length - 10} more"),
                                                      ),
                                                    ),
                                                  ),
                                                if (isCategoryWidgetExpanded(
                                                    cat['category']))
                                                  for (var yy = 10;
                                                      yy <
                                                          cat['ingredients']
                                                              .length;
                                                      yy++)
                                                    Card(
                                                      color: _isIngredientSelected(
                                                              cat['ingredients']
                                                                  [yy])
                                                          ? Theme.of(context)
                                                              .accentColor
                                                          : Colors.white,
                                                      child: InkWell(
                                                        onTap: () {
                                                          // TODO select ingredient
                                                          _toggleSelectIngredient(
                                                              cat['ingredients']
                                                                  [yy]);
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            "${cat['ingredients'][yy]}",
                                                            style: TextStyle(
                                                              color: _isIngredientSelected(
                                                                      cat['ingredients']
                                                                          [yy])
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ],
                      ),
                    )),
                    //
                    Expanded(
                      flex: 0,
                      child: Row(
                        children: [
                          Expanded(
                              child: RaisedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("My Pantry"),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  margin: EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(
                                    // shape: BoxShape.circle,
                                    borderRadius: BorderRadius.circular(50),
                                    color: Theme.of(context).accentColor,
                                  ),
                                  child: Text(
                                    "${_selectedIngredients.length}",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            onPressed: () {},
                          )),
                          SizedBox(width: 20),
                          Expanded(
                              child: RaisedButton(
                            color: Theme.of(context).accentColor,
                            textColor: $white,
                            child: Text("See Recipes"),
                            onPressed: () {},
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }

  Container buildVoiceInput(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 20),
      child: Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Text("Use your voice"),
              Text("Dictate many ingredients at once"),
              InkWell(
                onTap: () {
                  // TODO voice function
                },
                child: Container(
                  height: 60,
                  width: 60,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Icon(
                    Icons.mic,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildAppBar() {
    return Expanded(
      flex: 0,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.account_circle,
                size: 30,
                color: $white,
              ),
              onPressed: () {
                // TODO account
              },
            ),
            Column(
              children: [
                Text(
                  "My ingredients",
                  textScaleFactor: 1.2,
                  style: $text_white,
                ),
                Text(
                  "You have ${_selectedIngredients.length} ingredients",
                  style: $text_white,
                ),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.sort_by_alpha,
                      color: _areOrdered
                          ? $white
                          : Theme.of(context).disabledColor,
                    ),
                    onTap: () {
                      // TODO order
                      _toggleOrder();
                    },
                  ),
                  SizedBox(width: 5),
                  InkWell(
                    child: Icon(
                      Icons.remove_done,
                      color: $white,
                    ),
                    onTap: () {
                      // TODO remove
                      _emptySelectedIngredients();
                    },
                  ),
                  SizedBox(width: 5),
                  InkWell(
                    child: Icon(
                      Icons.copy,
                      color: $white,
                    ),
                    onTap: () {
                      // TODO copy to clipboard
                      _copyIngredientsToClipboard();
                    },
                  ),
                  SizedBox(width: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:foodlabs/models/Ingredient.dart';

class Recipe {
  int id;
  String name;
  String imageUrl;
  String thumbNail;

  List<String> steps;
  String difficulty;
  String cookTime;
  String cuisineType;
  String mealType;
  String nutritional;
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;
  bool isGlutenFree;

  List<Ingredient> ingredients;
  List<Ingredient> mainIngredients; // min ingredients

  int minServes; // serves
  int maxServes; // 6-8 persons

  double rating;
  int ratingCount;
  List<String> reviews;
  int views;
  int openedCount;
  int savedCount;
  List tags;

  // ext resources
  String fullUrl;

  DateTime date;
  String author;
}

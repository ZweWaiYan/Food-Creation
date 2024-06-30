import 'package:flutter/material.dart';
import 'package:food_creation/views/Area/foodAreaDataList.dart';
import 'package:food_creation/views/Area/foodAreaTitleList.dart';
import 'package:food_creation/views/Category/foodCategoryDataList.dart';
import 'package:food_creation/views/Category/foodCategoryTitleList.dart';
import 'package:food_creation/views/Home/foodDetailPage.dart';
import 'package:food_creation/views/Home/foodPage.dart';
import 'package:food_creation/views/Ingredient/foodIngredientDataList.dart';
import 'package:food_creation/views/Ingredient/foodIngredientTitleList.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Food Creation', initialRoute: '/', routes: {
      FoodPage.routeName: (context) => const FoodPage(),
      FoodDetailPage.routeName: (context) =>
          FoodDetailPage(mealId: ModalRoute.of(context)!.settings.arguments),
      //Area session
      FoodAreaTitleList.routeName: (context) => const FoodAreaTitleList(),
      FoodAreaDataList.routeName: (context) => FoodAreaDataList(
            areaData: ModalRoute.of(context)!.settings.arguments,
          ),
      //Category session
      FoodCategoryTitleList.routeName: (context) =>
          const FoodCategoryTitleList(),
      FoodCategoryDataList.routeName: (context) => FoodCategoryDataList(
            categoryData: ModalRoute.of(context)!.settings.arguments,
          ),
      //Ingredient session
      FoodIngredientTitleList.routeName: (context) =>
          const FoodIngredientTitleList(),
      FoodIngredientDataList.routeName: (context) => FoodIngredientDataList(
          ingredientData: ModalRoute.of(context)!.settings.arguments),
    });
  }
}

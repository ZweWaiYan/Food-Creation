import 'package:flutter/material.dart';
import 'package:food_creation/modal/categoryList.dart';
import 'package:food_creation/modal/ingredientList.dart';
import 'package:food_creation/views/Ingredient/foodIngredientDataList.dart';

class IngredientTitleListCom extends StatelessWidget {
  const IngredientTitleListCom({super.key, required this.ingredientList});

  final IngredientList ingredientList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, FoodIngredientDataList.routeName,
              arguments: ingredientList.strIngredient);
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                ingredientList.strIngredient,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Colors.black,
                thickness: 2,
                indent: 40,
                endIndent: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

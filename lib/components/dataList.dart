import 'package:flutter/material.dart';
import 'package:food_creation/modal/mainMealList.dart';
import 'package:food_creation/views/Home/foodDetailPage.dart';

class DataList extends StatelessWidget {
  const DataList({super.key, required this.mealList});

  final MealList mealList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, FoodDetailPage.routeName,
            arguments: mealList.idMeal);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(offset: Offset(5, 5), blurRadius: 11)
                ]),
            child: Image.network(
              mealList.strMealThumb,
              fit: BoxFit.cover,
              width: 150,
              height: 130,
            ),
          ),
          const SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              mealList.strMeal,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

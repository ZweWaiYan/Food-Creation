import 'package:flutter/material.dart';
import 'package:food_creation/modal/areaList.dart';
import 'package:food_creation/modal/categoryList.dart';
import 'package:food_creation/modal/foodFilter.dart';
import 'package:food_creation/views/Area/foodAreaDataList.dart';
import 'package:food_creation/views/Category/foodCategoryDataList.dart';

class CategoryTitleListCom extends StatelessWidget {
  const CategoryTitleListCom({super.key, required this.categoryList});

  final CategoryList categoryList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, FoodCategoryDataList.routeName,
              arguments: categoryList.strCategory);
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                categoryList.strCategory,
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

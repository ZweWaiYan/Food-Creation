import 'package:flutter/material.dart';
import 'package:food_creation/api/Ingredient/ingredientTitleList.dart';
import 'package:food_creation/components/ingredientTitleListCom.dart';
import 'package:food_creation/modal/categoryList.dart';
import 'package:food_creation/modal/ingredientList.dart';
import 'package:http/http.dart' as http;

class FoodIngredientTitleList extends StatefulWidget {
  static const routeName = '/FoodIngredientTitleList';
  const FoodIngredientTitleList({super.key});

  @override
  State<FoodIngredientTitleList> createState() =>
      _FoodIngredientTitleListState();
}

class _FoodIngredientTitleListState extends State<FoodIngredientTitleList> {
  final http.Client httpClient = http.Client();
  late Future<List<IngredientList>> ingredientTitleList;

  @override
  void initState() {
    super.initState();
    ingredientTitleList = fetchIngredientTitleList(httpClient);
  }

  @override
  void dispose() {
    httpClient.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          FutureBuilder<List<IngredientList>>(
            future: ingredientTitleList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Main meal list is empty'));
              } else {
                return Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: snapshot.data!
                        .map((ingredientTitleData) => IngredientTitleListCom(
                            ingredientList: ingredientTitleData))
                        .toList(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

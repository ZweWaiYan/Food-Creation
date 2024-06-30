import 'dart:convert';

import 'package:food_creation/modal/areaList.dart';
import 'package:food_creation/modal/mainMealList.dart';

import 'package:http/http.dart' as http;

Future<List<MealList>> fetchIngredientDataList(
    http.Client client, String ingredientParameter) async {
  final response = await client.get(Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/filter.php?i=$ingredientParameter'));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final List<dynamic> ingredientMealList = jsonResponse['meals'];
    return ingredientMealList.map((json) => MealList.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load ingredient data list');
  }
}

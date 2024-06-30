import 'dart:convert';

import 'package:food_creation/modal/areaList.dart';
import 'package:food_creation/modal/categoryList.dart';
import 'package:food_creation/modal/ingredientList.dart';

import 'package:http/http.dart' as http;

Future<List<IngredientList>> fetchIngredientTitleList(
    http.Client client) async {
  final response = await client.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/list.php?i=list'));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final List<dynamic> ingredientJson = jsonResponse['meals'];
    return ingredientJson.map((json) => IngredientList.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load ingredient title list');
  }
}

import 'dart:convert';

import 'package:food_creation/modal/areaList.dart';
import 'package:food_creation/modal/categoryList.dart';
import 'package:food_creation/modal/ingredientList.dart';

import 'package:http/http.dart' as http;

Future<List<CategoryList>> fetchCategoryTitleList(http.Client client) async {
  final response = await client.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/list.php?c=list'));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final List<dynamic> categoryJson = jsonResponse['meals'];
    return categoryJson.map((json) => CategoryList.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load category title list');
  }
}

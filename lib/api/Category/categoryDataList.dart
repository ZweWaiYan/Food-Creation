import 'dart:convert';

import 'package:food_creation/modal/mainMealList.dart';
import 'package:http/http.dart' as http;

Future<List<MealList>> fetchCategoryDataList(
    http.Client client, String categoryParameter) async {
  final response = await client.get(Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/filter.php?c=$categoryParameter'));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final List<dynamic> categoryMealList = jsonResponse['meals'];
    return categoryMealList.map((json) => MealList.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load category data list');
  }
}

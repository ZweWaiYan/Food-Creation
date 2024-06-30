import 'dart:convert';

import 'package:food_creation/modal/mainMealList.dart';
import 'package:http/http.dart' as http;

Future<List<MealList>> fetchMainMealList(http.Client client) async {
  final response = await client.get(Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/filter.php?i=chicken_breast'));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final List<dynamic> mainMealJson = jsonResponse['meals'];
    return mainMealJson.map((json) => MealList.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load main meal list');
  }
}

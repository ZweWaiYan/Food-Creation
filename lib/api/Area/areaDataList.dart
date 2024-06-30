import 'dart:convert';

import 'package:food_creation/modal/areaList.dart';
import 'package:food_creation/modal/mainMealList.dart';

import 'package:http/http.dart' as http;

Future<List<MealList>> fetchAreaDataList(
    http.Client client, String areaParameter) async {
  final response = await client.get(Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/filter.php?a=$areaParameter'));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final List<dynamic> areaMealList = jsonResponse['meals'];
    return areaMealList.map((json) => MealList.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load area Data list');
  }
}

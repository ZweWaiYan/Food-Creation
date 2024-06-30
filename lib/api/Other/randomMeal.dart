// ignore_for_file: file_names

import 'dart:convert';

import 'package:food_creation/modal/randomMealModal.dart';
import 'package:http/http.dart' as http;

Future<randomMealModal> fetchRandomMeal(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final dynamic randomJson = jsonResponse['meals'][0];
    return randomMealModal.fromJson(randomJson);
  } else {
    throw Exception('Failed to load random meal');
  }
}

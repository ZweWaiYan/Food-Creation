// ignore_for_file: file_names

import 'dart:convert';
import 'package:food_creation/modal/detail.dart';
import 'package:http/http.dart' as http;

Future<Detail> fetchmealDetailById(http.Client client, int meatId) async {
  final response = await client.get(Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$meatId'));

  if (response.statusCode == 200) {
    return Detail.fromJson(json.decode(response.body)['meals'][0]);
  } else {
    throw Exception('Failed to load detail meal');
  }
}

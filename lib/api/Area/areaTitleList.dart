import 'dart:convert';

import 'package:food_creation/modal/areaList.dart';

import 'package:http/http.dart' as http;

Future<List<AreaList>> fetchAreaTitleList(http.Client client) async {
  final response = await client.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/list.php?a=list'));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final List<dynamic> areaJson = jsonResponse['meals'];
    return areaJson.map((json) => AreaList.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load area title list');
  }
}

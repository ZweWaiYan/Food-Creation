import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:food_creation/api/Other/mealDetailById.dart';
import 'package:food_creation/components/detailPage.dart';
import 'package:food_creation/modal/detail.dart';
import 'package:http/http.dart' as http;

class FoodDetailPage extends StatefulWidget {
  static const routeName = '/FoodDetailPage';
  const FoodDetailPage({super.key, required this.mealId});

  final Object? mealId;

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  final http.Client httpClient = http.Client();
  late Future<Detail> detail;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    detail =
        fetchmealDetailById(httpClient, int.parse(widget.mealId.toString()));
  }

  @override
  void dispose() {
    httpClient.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Detail>(
        future: detail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return DetailPage(
              detailData: snapshot.data!,
            );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}

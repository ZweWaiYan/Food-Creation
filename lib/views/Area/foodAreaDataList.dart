import 'package:flutter/material.dart';
import 'package:food_creation/api/Area/areaDataList.dart';
import 'package:food_creation/components/dataList.dart';
import 'package:food_creation/modal/mainMealList.dart';
import 'package:http/http.dart' as http;

class FoodAreaDataList extends StatefulWidget {
  static const routeName = '/FoodAreaDataList';

  const FoodAreaDataList({super.key, required this.areaData});

  final Object? areaData;

  @override
  State<FoodAreaDataList> createState() => _FoodAreaDataListState();
}

class _FoodAreaDataListState extends State<FoodAreaDataList> {
  final http.Client httpClient = http.Client();
  late Future<List<MealList>> mealList;

  @override
  void initState() {
    super.initState();
    mealList = fetchAreaDataList(httpClient, widget.areaData.toString());
  }

  @override
  void dispose() {
    httpClient.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          FutureBuilder<List<MealList>>(
            future: mealList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Area Data list is empty'));
              } else {
                return Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 3,
                    children: snapshot.data!
                        .map((areaList) => DataList(mealList: areaList))
                        .toList(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

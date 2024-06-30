import 'package:flutter/material.dart';
import 'package:food_creation/api/Category/categoryTitleList.dart';
import 'package:food_creation/components/categoryTitleListCom.dart';
import 'package:food_creation/modal/categoryList.dart';
import 'package:http/http.dart' as http;

class FoodCategoryTitleList extends StatefulWidget {
  static String routeName = '/FoodCategoryTitleList';
  const FoodCategoryTitleList({super.key});

  @override
  State<FoodCategoryTitleList> createState() => _FoodCategoryTitleListState();
}

class _FoodCategoryTitleListState extends State<FoodCategoryTitleList> {
  final http.Client httpClient = http.Client();
  late Future<List<CategoryList>> categoryTitleList;

  @override
  void initState() {
    super.initState();
    categoryTitleList = fetchCategoryTitleList(httpClient);
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
          FutureBuilder<List<CategoryList>>(
            future: categoryTitleList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Main meal list is empty'));
              } else {
                return Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: snapshot.data!
                        .map((categoryTitleData) => CategoryTitleListCom(
                            categoryList: categoryTitleData))
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

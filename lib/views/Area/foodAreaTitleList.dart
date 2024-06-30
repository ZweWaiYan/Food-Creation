import 'package:flutter/material.dart';
import 'package:food_creation/api/Area/areaTitleList.dart';
import 'package:food_creation/components/areaTitleListCom.dart';
import 'package:food_creation/modal/areaList.dart';
import 'package:http/http.dart' as http;

class FoodAreaTitleList extends StatefulWidget {
  static const routeName = '/FoodAreaTitleList';
  const FoodAreaTitleList({super.key});

  @override
  State<FoodAreaTitleList> createState() => _FoodAreaListState();
}

class _FoodAreaListState extends State<FoodAreaTitleList> {
  final http.Client httpClient = http.Client();
  late Future<List<AreaList>> areaTitleList;

  @override
  void initState() {
    super.initState();
    areaTitleList = fetchAreaTitleList(httpClient);
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
          FutureBuilder<List<AreaList>>(
            future: areaTitleList,
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
                        .map((areaTitleData) =>
                            AreaTitleListCom(areaList: areaTitleData))
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

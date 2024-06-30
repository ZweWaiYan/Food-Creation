import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_creation/api/Other/mainMealList.dart';
import 'package:food_creation/api/Other/randomMeal.dart';
import 'package:food_creation/components/mainPageCard.dart';
import 'package:food_creation/components/randomCom.dart';
import 'package:food_creation/components/sliderList.dart';
import 'package:food_creation/modal/mainMealList.dart';
import 'package:food_creation/modal/randomMealModal.dart';
import 'package:food_creation/views/Area/foodAreaTitleList.dart';
import 'package:food_creation/views/Category/foodCategoryTitleList.dart';
import 'package:food_creation/views/Home/foodDetailPage.dart';
import 'package:food_creation/views/Ingredient/foodIngredientTitleList.dart';
import 'package:http/http.dart' as http;

class FoodPage extends StatefulWidget {
  static const routeName = '/';

  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final http.Client httpClient = http.Client();
  late Future<List<MealList>> mainMealList;
  final CarouselController _controller = CarouselController();
  late Future<randomMealModal> randomMeal;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    mainMealList = fetchMainMealList(httpClient);
    randomMeal = fetchRandomMeal(httpClient);
  }

  @override
  void dispose() {
    httpClient.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Good Morning',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, FoodIngredientTitleList.routeName);
                },
                child: const MainPageCard(
                  menuImg: 'assets/ingredient.png',
                  menuTitle: 'Ingredients',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, FoodAreaTitleList.routeName);
                },
                child: const MainPageCard(
                  menuImg: 'assets/area.png',
                  menuTitle: 'Area',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, FoodCategoryTitleList.routeName);
                },
                child: const MainPageCard(
                  menuImg: 'assets/category.png',
                  menuTitle: 'Categories',
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.only(left: 20, bottom: 5),
            alignment: Alignment.topLeft,
            child: const Text(
              'Most insterested menu',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ),
          FutureBuilder<List<MealList>>(
            future: mainMealList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Main meal list is empty'));
              } else {
                return CarouselSlider(
                  items: snapshot.data!
                      .map((mainMeal) => SliderList(mainMealList: mainMeal))
                      .toList(),
                  carouselController: _controller,
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(
                        () {
                          _current = index;
                        },
                      );
                    },
                  ),
                );
              }
            },
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20),
            alignment: Alignment.topLeft,
            child: const Text(
              'Today special menu',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 15),
          FutureBuilder<randomMealModal>(
            future: randomMeal,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return RandomCom(randomMeal: snapshot.data!);
              }
            },
          ),
        ],
      ),
    );
  }
}

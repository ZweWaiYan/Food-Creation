import 'package:flutter/material.dart';
import 'package:food_creation/modal/mainMealList.dart';
import 'package:food_creation/modal/randomMealModal.dart';
import 'package:food_creation/views/Home/foodDetailPage.dart';

class RandomCom extends StatelessWidget {
  const RandomCom({super.key, required this.randomMeal});

  final randomMealModal randomMeal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, FoodDetailPage.routeName,
            arguments: randomMeal.idMeal);
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [BoxShadow(offset: Offset(6, 6), blurRadius: 11)],
        ),
        margin: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: [
              Image.network(
                randomMeal.strMealThumb,
                fit: BoxFit.cover,
                width: 350.0,
                height: 250.0,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    randomMeal.strMeal,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

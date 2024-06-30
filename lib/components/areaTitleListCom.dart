import 'package:flutter/material.dart';
import 'package:food_creation/modal/areaList.dart';
import 'package:food_creation/modal/foodFilter.dart';
import 'package:food_creation/views/Area/foodAreaDataList.dart';

class AreaTitleListCom extends StatelessWidget {
  const AreaTitleListCom({super.key, required this.areaList});

  final AreaList areaList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, FoodAreaDataList.routeName,
              arguments: areaList.strArea);
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                areaList.strArea,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              const Divider(
                color: Colors.black,
                thickness: 2,
                indent: 40,
                endIndent: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

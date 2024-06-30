import 'dart:ffi';

import 'package:flutter/material.dart';

class MainPageCard extends StatelessWidget {
  const MainPageCard({
    super.key,
    required this.menuImg,
    required this.menuTitle,
  });

  final String menuImg;
  final String menuTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: const [BoxShadow(offset: Offset(2, 2), blurRadius: 11)],
      ),
      width: 105,
      height: 110,
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Image.asset(
                menuImg,
                width: 45,
              ),
            ),
            const SizedBox(height: 5),
            const Divider(
              color: Colors.black,
              thickness: 2,
              indent: 15,
              endIndent: 15,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Text(
                menuTitle,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

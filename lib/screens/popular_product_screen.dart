import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:profertility/main.dart';
import 'package:profertility/screens/theme/colors.dart';

class PopularProductScreen extends StatelessWidget {
   PopularProductScreen({Key? key}) : super(key: key);
  List<String> imageList = [
    "assets/images/medpic1.png",
    "assets/images/medpic2.png",
    "assets/images/medpic1.png",
    "assets/images/medpic2.png",
    "assets/images/medpic1.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: (() {}),
                        child: const Icon(
                          Icons.arrow_back_rounded,
                        )),
                    const Text(
                      "Popular Products",
                      style: TextStyle(
                          color: Color(0xFF4D1A53),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Filters",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset("assets/images/filtericon.png")
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
              child: Text(
                "36 Total Products",
                style: TextStyle(color: Color(ThemeColor.primaryColor)),
              ),
            ),
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(children: [
                      Container(),
                    ]),
                  );
                }),
          ],
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:profertility/screens/widgets/primary_button.dart';

class SelectGenderScreen extends StatelessWidget {
  const SelectGenderScreen({Key? key}) : super(key: key);
  final bool isSelected=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                        )),
                    // Image.asset("assets/images/checkbox.png"),
                    const SizedBox(
                      height: 34,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Please select your Gender",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4D1A53),
                            ),
                          ),
                          const SizedBox(
                            height: 34,
                          ),
                          const Text(
                            "On the basis of the your selection the further Questionnaires will be asked to you. ",
                            style: TextStyle(
                              color: Color(0xFF898989),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 162,
                                height: 252,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/bluebg.png")),
                                ),
                                child: Column(children: [
                                  Container(
                                    margin: const EdgeInsets.all(26),
                                    child:
                                        Image.asset("assets/images/male.png"),
                                  ),
                                  Expanded(
                                      child: Image.asset(
                                    "assets/images/whitecircle.png",
                                    fit: BoxFit.fill,
                                  ))
                                ]),
                              ),
                              Container(
                                width: 162,
                                height: 252,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/bluebg.png")),
                                ),
                                child: Column(children: [
                                  Container(
                                    margin: const EdgeInsets.all(26),
                                    child:
                                        Image.asset("assets/images/girl.png"),
                                  ),
                                  Expanded(
                                      child: Image.asset(
                                    "assets/images/tickcircle.png",
                                    fit: BoxFit.fill,
                                  ))
                                ]),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          PrimaryButton(title: "Continue", onPressed: () {}),
                        ],
                      ),
                    ),
                  ]),
            ),
            // const SizedBox(
            //   height: 45,
            // ),

            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                  width: 155,
                  height: 165,
                  child: Image.asset(
                    "assets/images/bottombg.png",
                    fit: BoxFit.fill,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

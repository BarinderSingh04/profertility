import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:profertility/screens/navigation_screen.dart';

import '../config/config.dart';
import 'general_questions_screen.dart';
import 'profile_setup_screen.dart';
import 'widgets/primary_button.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final controller = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/background.png",
              height: 120,
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (selectedIndex == 0) {
                            Navigator.of(context).pop();
                          } else {
                            controller.previousPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset("assets/images/arrow-left.png"),
                        ),
                      ),
                      Text(
                        selectedIndex < 2
                            ? "Biological"
                            : "Lifestyle and Habits",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff4d1a53),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 8,
                          value: (selectedIndex + 1) / 4,
                          backgroundColor:
                              Theme.of(context).primaryColor.withOpacity(0.2),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: PageView(
                    onPageChanged: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                    controller: controller,
                    children: const [
                      FirstPage(),
                      SecondPage(),
                      ThirdPage(),
                      FourthPage(),
                    ],
                  ),
                ),
                SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 16.0,
                    ),
                    child: PrimaryButton(
                      title: "Continue",
                      onPressed: () {
                        if (selectedIndex == 3) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const NavigationScreen(),
                            ),
                          );
                        }
                        controller.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16.0),
      children: [
        const NoteWidget(text: "General Questions"),
        const SizedBox(height: 16),
        InputFormField(
          hint: "Enter your age in years",
          title: "How old are you?",
        ),
        const SizedBox(height: 24),
        SelectionFormField(
          hint: "Select relationship status",
          title: "Relationship Status",
          options: const [
            "Single",
            "In a relationship",
            "Married",
            "Widowed",
            "divorced",
            "separated",
            "registered civil partnership",
          ],
        ),
        const SizedBox(height: 24),
        InputFormField(
          hint: "Enter input in cm",
          title: "How tall are you?",
          suffix: "Cm",
        ),
        const SizedBox(height: 24),
        InputFormField(
          title: "How much do you weigh today?",
          hint: "Enter input in kg",
          suffix: "Kg",
        ),
        const SizedBox(height: 24),
        InputFormField(
          title: "How much did you weight a year ago?",
          hint: "Enter input in kg",
          suffix: "Kg",
        ),
        const SizedBox(height: 24),
        ToggleFormField(
          title: "Which sex is your partner?",
          option1: "Male",
          option2: "Female",
        ),
        const SizedBox(height: 8),
        InputFormField(
          title: "How old is your partner",
          hint: "Enter your partner age in years",
        ),
        const SizedBox(height: 24),
        SliderFormField(
          min: 1,
          max: 8,
          division: 7,
          label: (value) {
            if (value > 7) {
              return "$value+ years";
            }
            return "$value years";
          },
          title: "How long have you and your partner been in a relationship?",
          labelWidget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "1 year",
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 12.0,
                ),
              ),
              Text(
                "8+ years",
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 34),
        const NoteWidget(text: "Your current circumstances"),
        const SizedBox(height: 24),
        ToggleFormField(
          title: "Are you currently actively trying to conceive?",
          onChange: (value) {},
        ),
        const SizedBox(height: 8),
        Column(
          children: [
            InputFormField(
              hint: "Months...",
              keyboardType: TextInputType.number,
              title: "How long have you been trying to conceive "
                  "(Number of months having regular, unprotected sexual intercourse)",
            ),
            const SizedBox(height: 20),
            SelectionFormField<String>(
              hint: "Select",
              textfieldHint: "Describe:",
              title: "Who took the initiative to the decision "
                  "that you should try to get pregnant?",
              requireTextField: (value) {
                if (value != null) {
                  return value.contains("Another person or persons");
                }
                return false;
              },
              options: const [
                "Just me",
                "Mostly me",
                "My partner and I equally",
                "Just my partner",
                "Mostly my partner",
                "Another person or persons",
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
        SliderFormField(
          min: 1,
          max: 8,
          division: 7,
          label: (value) {
            if (value > 7) {
              return "$value+ times/w";
            }
            return "$value times/w";
          },
          title: "How many times a week on average do you "
              "have vaginal intercourse? (Round up or down)",
          labelWidget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SizedBox(
                width: 80,
                child: Text(
                  "Fewer than 1 times/w",
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xff1d1d1d),
                    fontSize: 12.0,
                  ),
                ),
              ),
              SizedBox(
                width: 80,
                child: Text(
                  "8 or more times/w",
                  maxLines: 2,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xff1d1d1d),
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        SelectionFormField<String>(
          hint: "Select...",
          title: "How satisfied or dissatisfied are you with your sex life?",
          options: const [
            "Very dissatisfied",
            "Quite dissatisfied",
            "Neither satisfied nor dissatisfied",
            "Quite satisfied",
            "Very satisfied",
          ],
        ),
      ],
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16.0),
      children: [
        const NoteWidget(text: "Menstrual cycle"),
        const SizedBox(height: 16),
        Column(
          children: [
            const Text(
              "When was the first day of your last period? "
              "(If you can't remember the exact date, "
              "please give simply the year and month)",
              style: TextStyle(
                color: Color(0xff1d1d1d),
              ),
            ),
            const SizedBox(height: 24),
            DateTimeFormField(
              context: context,
              hint: "Select Last Menstrual Date",
            ),
          ],
        ),
        const SizedBox(height: 24),
        ToggleFormField(title: "Is your menstrual cycle regular"),
        const SizedBox(height: 8),
        InputFormField(
          hint: "Enter menstrual cycle details",
          title: "How long is your normal menstrual cycle? "
              "(A menstrual cycle is the time between "
              "the first day of one period and the first "
              "day of the next)",
        ),
        const SizedBox(height: 24),
        SliderFormField(
          title: "Typically, what is your menstrual cycle flow?",
          min: 1,
          max: 3,
          division: 2,
          label: (value) {
            switch (value) {
              case 1:
                return "Heavy";
              case 2:
                return "Light";
              case 3:
                return "Normal";
              default:
                return "Heavy";
            }
          },
          labelWidget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Heavy",
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 12.0,
                ),
              ),
              Text(
                "Light",
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 12.0,
                ),
              ),
              Text(
                "Normal",
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        SelectionFormField(
          title:
              "How much menstrual pain did you have with your most recent period?",
          options: const [
            "Severe pain",
            "Quite bad pain",
            "Neither severe nor insignificant pain",
            "Mild pain",
            "Hardly any pain",
          ],
          hint: "Select...",
        ),
        const SizedBox(height: 24),
        InputFormField(
          hint: "Enter your age",
          title: "How old were you when you had your first menstruation?",
        ),
        const SizedBox(height: 24),
        Wrap(
          runSpacing: 8,
          children: Config.healthAndGynae
              .map(
                (e) => ToggleFormField(title: e),
              )
              .toList(),
        ),
        const SizedBox(height: 24),
        SelectionFormField(
          title: "How is your general health just now?",
          options: const [
            "Very good",
            "Quite good",
            "Neither good nor bad",
            "Quite bad",
            "Very bad",
          ],
          hint: "Select...",
        ),
        const SizedBox(height: 30),
        const NoteWidget(text: "Genetic Predispositions"),
        const SizedBox(height: 24),
        InputFormField(
          hint: "Enter details",
          title: "How old was your mother when she reached menopause",
        ),
        const SizedBox(height: 30),
        const NoteWidget(text: "Previous Pregnancies"),
        const SizedBox(height: 16),
        ToggleFormField(
          title: "Have you ever been pregnant "
              "(include miscarriages and abortions)?",
        ),
        const SizedBox(height: 24),
        SliderFormField(
          title: "How many times have you been pregnant "
              "(include miscarriages and abortions)?",
          min: 0,
          max: 9,
          division: 8,
          label: (value) {
            if (value > 8) {
              return "$value+ times";
            }
            return "$value times";
          },
          labelWidget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "0 times",
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 12.0,
                ),
              ),
              Text(
                "9+ times",
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        InputFormField(
          hint: "Enter age in years",
          title: "How old were you when you became pregnant "
              "for the first time (include miscarriages "
              "and abortions)?",
        ),
        const SizedBox(height: 24),
        SliderFormField(
          title: "How many times have you had a "
              "miscarriage in months 0-6?",
          min: 0,
          max: 6,
          division: 6,
          label: (value) {
            if (value > 5) {
              return "$value+ times";
            }
            return "$value times";
          },
          labelWidget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "0 times",
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 12.0,
                ),
              ),
              Text(
                "6+ times",
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        SliderFormField(
          title: "How many times have you had an abortion?",
          min: 0,
          max: 6,
          division: 6,
          label: (value) {
            if (value > 5) {
              return "$value+ times";
            }
            return "$value times";
          },
          labelWidget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "0 times",
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 12.0,
                ),
              ),
              Text(
                "6+ times",
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        SliderFormField(
          title: "How many times have you had an ectopic pregnancy?",
          min: 0,
          max: 6,
          division: 6,
          label: (value) {
            if (value > 5) {
              return "$value+ times";
            }
            return "$value times";
          },
          labelWidget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "0 times",
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 12.0,
                ),
              ),
              Text(
                "6+ times",
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        ToggleFormField(
          title: "Have you ever given birth to a child?",
        ),
        const SizedBox(height: 8),
        Wrap(
          runSpacing: 20,
          children: Config.previousPregnancies
              .map(
                (e) => SliderFormField(
                  title: e,
                  min: 0,
                  max: 5,
                  division: 5,
                  label: (value) {
                    if (value > 4) {
                      return "$value+";
                    }
                    return "$value";
                  },
                  labelWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "0 ",
                        style: TextStyle(
                          color: Color(0xff1d1d1d),
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        "5 or more",
                        style: TextStyle(
                          color: Color(0xff1d1d1d),
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16.0),
      children: [
        const NoteWidget(text: "Eating habits"),
        const Gap(20),
        Wrap(
          runSpacing: 4.0,
          children: Config.eatingHabits
              .map((e) => ToggleFormField(title: e))
              .toList(),
        ),
        const Gap(20),
        const NoteWidget(text: "Fruits and vegetables"),
        const Gap(20),
        Wrap(
          runSpacing: 4.0,
          children: Config.fruitAndVegetables
              .map((e) => ToggleFormField(title: e))
              .toList(),
        ),
        const Gap(20),
        const NoteWidget(text: "Fat"),
        const Gap(20),
        Wrap(
          runSpacing: 4.0,
          children: Config.fat.map((e) => ToggleFormField(title: e)).toList(),
        ),
        const Gap(20),
        const NoteWidget(text: "Starchy foods"),
        const Gap(20),
        Wrap(
          runSpacing: 4.0,
          children:
              Config.starchyFood.map((e) => ToggleFormField(title: e)).toList(),
        ),
      ],
    );
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16.0),
      children: [
        const NoteWidget(text: "Sugar"),
        const Gap(20),
        Wrap(
          runSpacing: 4.0,
          children: Config.sugar.map((e) => ToggleFormField(title: e)).toList(),
        ),
        const Gap(20),
        const NoteWidget(text: "Drinks and alchohol"),
        const Gap(20),
        Wrap(
          runSpacing: 4.0,
          children:
              Config.drinks.map((e) => ToggleFormField(title: e)).toList(),
        ),
        const Gap(20),
        SliderFormField(
          title: "How much coffee do you drink on average a day"
              "(1cup=1.5dl)? (Answer in number of cups a day)",
          min: 0,
          max: 8,
          division: 8,
          label: (value) {
            if (value == 0) {
              return "I dont drink";
            } else if (value > 7) {
              return "$value+ cups/d.";
            }
            return "$value cups/d.";
          },
          labelWidget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SizedBox(
                width: 90,
                child: Text(
                  "I dont drink",
                  style: TextStyle(
                    color: Color(0xff1d1d1d),
                    fontSize: 12.0,
                  ),
                ),
              ),
              SizedBox(
                width: 90,
                child: Text(
                  "8 or more Cups",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Color(0xff1d1d1d),
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

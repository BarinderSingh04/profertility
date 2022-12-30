import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'reminder_screen.dart';
import 'widgets/my_appbar.dart';
import 'widgets/primary_button.dart';

class AddReminderScreen extends StatefulWidget {
  const AddReminderScreen({super.key});

  @override
  State<AddReminderScreen> createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  bool notifications = true;
  bool setEveryday = false;
  List<Map<String, dynamic>> days = [
    {"day": "Mon", "isSelected": false},
    {"day": "Tue", "isSelected": false},
    {"day": "Wed", "isSelected": true},
    {"day": "Thu", "isSelected": false},
    {"day": "Fri", "isSelected": false},
    {"day": "Sat", "isSelected": false},
    {"day": "Sun", "isSelected": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(
        title: "Set a Reminder",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const Gap(20),
            const Text("Hi, Alireza"),
            const Gap(14),
            const Text(
              "Here's your moving checklist!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Gap(20),
            const ScheduleWidget(),
            const Gap(20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Topic",
              ),
            ),
            const Gap(16),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Description",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    width: 1.5,
                    color: Color(0xFF00AFA4),
                  ),
                ),
              ),
            ),
            const Gap(16.0),
            tile("Notifications", notifications, () {
              setState(() {
                notifications = !notifications;
              });
            }),
            tile("Set For Everyday", setEveryday, () {
              setState(() {
                setEveryday = !setEveryday;
              });
            }),
            const Gap(16.0),
            SizedBox(
              height: 100,
              child: ListView.separated(
                itemCount: days.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final daysMap = days[index];
                  return card(
                    daysMap["day"],
                    daysMap["isSelected"],
                    () {
                      setState(() {
                        days[index] = {
                          "day": daysMap["day"],
                          "isSelected": !daysMap["isSelected"]
                        };
                      });
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const Gap(10);
                },
              ),
            ),
            const Gap(24.0),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: PrimaryButton(
                  title: "Set Reminder",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget card(String title, bool value, VoidCallback onClick) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 70,
        decoration: BoxDecoration(
          color: const Color(0xffF5F6F8),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Image.asset(
              value ? "assets/images/on.png" : "assets/images/off.png",
            ),
            Text(
              title.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tile(String title, bool value, VoidCallback onClick) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: onClick,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              value
                  ? "assets/images/tick_on.png"
                  : "assets/images/tick_off.png",
            ),
          ),
        )
      ],
    );
  }
}

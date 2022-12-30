import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:profertility/screens/add_reminder_screen.dart';
import 'package:profertility/screens/widgets/my_appbar.dart';
import 'package:profertility/screens/widgets/primary_button.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(title: "Alert & Reminders"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Wrap(
              runSpacing: 14,
              children: const [
                ScheduleItem(
                  title: "Omega Capsules",
                  time: "10:00 - 19:00",
                  desc: "After Lunch",
                  color: Colors.pink,
                ),
                ScheduleItem(
                  title: "Online Consultation",
                  time: "10:00 - 19:00",
                  desc: "About heath illness during....",
                  color: Colors.green,
                ),
                ScheduleItem(
                  title: "Exercise",
                  time: "10:00 - 19:00",
                  desc: "Early in the morning..",
                  color: Colors.amber,
                )
              ],
            ),
            const Spacer(),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: PrimaryButton(
                  title: "Add New Reminder",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddReminderScreen(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({super.key});

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetsState();
}

class _ScheduleWidgetsState extends State<ScheduleWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    DateFormat("EEE, d MMM").format(DateTime.now()),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              getDatesList().length,
              (index) {
                final date = getDatesList()[index];
                return CalenderWidget(
                  onClick: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  day: DateFormat("EEE").format(date),
                  date: date.day.toString(),
                  isSelected: selectedIndex == index,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  List<DateTime> getDatesList() {
    return List.generate(8, (index) {
      final date = DateTime.now();
      return date.add(Duration(days: index + 1));
    });
  }
}

class ScheduleItem extends StatelessWidget {
  final String title;
  final String time;
  final String desc;
  final Color color;
  const ScheduleItem({
    Key? key,
    required this.title,
    required this.time,
    required this.desc,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddReminderScreen(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 2, top: 16, bottom: 16, right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 245, 244, 244),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              VerticalDivider(thickness: 2.0, color: color),
              const Gap(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const Gap(60),
                        Text(
                          time,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const Gap(10),
                    Text(
                      desc,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalenderWidget extends StatelessWidget {
  final String day;
  final bool isSelected;
  final String date;
  final VoidCallback? onClick;
  const CalenderWidget({
    Key? key,
    required this.day,
    required this.date,
    required this.isSelected,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 55,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
          color: Color.fromARGB(255, 251, 249, 249),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(8.0),
            Container(
              width: 42,
              height: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? const Color(0xFF00AFA4) : null,
              ),
              child: Text(
                date,
                style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

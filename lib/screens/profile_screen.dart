import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:profertility/screens/form_screen.dart';
import 'package:profertility/screens/health_score_screen.dart';
import 'package:profertility/screens/profile_setup_screen.dart';
import 'package:profertility/screens/reminder_screen.dart';
import 'package:profertility/screens/signup_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool email = false;
  bool password = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Color(0xff4d1a53),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/profile.png"),
                      ),
                    ),
                  ),
                  const Gap(12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Simran Ahitaan",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(6.0),
                        Text(
                          "You can customise your profile here",
                          style: TextStyle(
                            color: Color(0xff4d1a53),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const Gap(24),
              Text(
                "Personal Profile".toUpperCase(),
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Color(0xffB7B7B7),
                ),
              ),
              const Gap(16.0),
              Wrap(
                runSpacing: 16.0,
                children: [
                  ProfileTile(
                    image: "assets/images/vuesax-linear-profile-circle.png",
                    title: "Update Personal Information",
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProfileSetupScreen(
                            editProfile: true,
                          ),
                        ),
                      );
                    },
                  ),
                  ProfileTile(
                    image: "assets/images/vuesax-linear-chart.png",
                    title: "Set Your Health Score",
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const HealthScoreScreen(score: 96),
                        ),
                      );
                    },
                  ),
                  ProfileTile(
                    image: "assets/images/vuesax-linear-message-edit.png",
                    title: "My Questionnaires",
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const FormScreen(),
                        ),
                      );
                    },
                  ),
                  ProfileTile(
                    image: "assets/images/lamp.png",
                    title: "Alert & Reminders",
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ReminderScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const Gap(24),
              Text(
                "Notifications".toUpperCase(),
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Color(0xffB7B7B7),
                ),
              ),
              const Gap(16.0),
              ProfileTile(
                image: "assets/images/email.png",
                title: "Email",
                isSelectable: email,
                onClick: () {
                  setState(() {
                    email = !email;
                  });
                },
              ),
              const Gap(16),
              ProfileTile(
                image: "assets/images/call-outgoing.png",
                title: "Phone Number",
                isSelectable: password,
                onClick: () {
                  setState(() {
                    password = !password;
                  });
                },
              ),
              const Gap(16),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xff4d1a53),
                  ),
                  onPressed: () {},
                  child: const Text("Raise a complaint"),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()),
                        (route) => false);
                  },
                  child: const Text("Logout"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String image;
  final String title;
  final bool? isSelectable;
  final VoidCallback? onClick;
  const ProfileTile({
    Key? key,
    required this.image,
    required this.title,
    this.isSelectable,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xffF3FBFB),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 24,
              height: 24,
              fit: BoxFit.cover,
              color: Theme.of(context).primaryColor,
            ),
            const Gap(12.0),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            if (isSelectable != null)
              Image.asset(
                isSelectable!
                    ? "assets/images/tick_on.png"
                    : "assets/images/tick_off.png",
                width: 35,
                height: 35,
              )
            else
              Image.asset(
                "assets/images/Vector.png",
                width: 30,
                height: 30,
              ),
          ],
        ),
      ),
    );
  }
}

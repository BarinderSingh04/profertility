import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profertility/screens/home_screen.dart';
import 'package:profertility/screens/nearby_doctor_screen.dart';
import 'package:profertility/screens/personalized_screen.dart';
import 'package:profertility/screens/test_list_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: const [
            HomeScreen(),
            PersonalizedScreen(),
            NearbyDoctorScreen(),
            TestListScreen(),
            PersonalizedScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: "null",
              icon: Image.asset(
                "assets/images/category.png",
                color: selectedIndex == 0
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              label: "null",
              icon: Image.asset(
                "assets/images/search-normal.png",
                color: selectedIndex == 1
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              label: "null",
              icon: Image.asset(
                "assets/images/personalcard.png",
                color: selectedIndex == 2
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              label: "null",
              icon: Image.asset(
                "assets/images/user_profile.png",
                color: selectedIndex == 3
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              label: "null",
              icon: Image.asset(
                "assets/images/more.png",
                color: selectedIndex == 4
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:finance_app/utils/constrents/app_images/app_images.dart';
import 'package:finance_app/view/app_screens/home_screen/body_screen.dart';
import 'package:finance_app/view/app_screens/home_screen/goal_screen.dart';
import 'package:finance_app/view/app_screens/home_screen/history_screen.dart';
import 'package:finance_app/view/app_screens/home_screen/home_view_screen.dart';
import 'package:finance_app/view/app_screens/home_screen/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<String> labels = ["HOME", "HISTORY", "ADD", "GOALS", "PROFILE"];

  final List<String> icons = [
    AppImages.homeIcon,
    AppImages.historyIcon,
    AppImages.addIcon,
    AppImages.goalIcon,
    AppImages.userIcon,
  ];

  // 🔹 Screens List
  final List<Widget> screens = const [
    HomeViewScreen(),
    HistoryScreen(),
    BodyScreen(),
    GoalScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      // 🔹 Show selected screen
      body: screens[selectedIndex],

      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(labels.length, (index) {
            final isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 🔹 Icon
                  Image.asset(
                    icons[index],
                    height: 24,
                    width: 24,
                    color: isSelected ? Colors.blue : Colors.grey,
                  ),

                  const SizedBox(height: 6),

                  // 🔹 Label
                  Text(
                    labels[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                      color: isSelected ? Colors.blue : Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

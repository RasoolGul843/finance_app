import 'package:finance_app/utils/constrents/app_images/app_images.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 1;

  final List<String> labels = ["HOME", "HISTORY", "ADD", "GOALS", "PROFILE"];

  final List<String> icons = [
    AppImages.passwordIcon,
    AppImages.passwordIcon,
    AppImages.passwordIcon,
    AppImages.passwordIcon,
    AppImages.passwordIcon,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: Center(
        child: Text(
          labels[selectedIndex],
          style: const TextStyle(fontSize: 24),
        ),
      ),

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
                  // 🔹 Asset Icon
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

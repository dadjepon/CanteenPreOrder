// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 105, 4, 4),
      body: Center(
        // Center the content for larger screens
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: 800), // Limit the max width
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 48.0), // Increase padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                Image.asset('images/pizza.jpeg',
                    height: 180), // Increased image size
                const SizedBox(height: 30),
                Image.asset('images/pizza.jpeg',
                    height: 180), // Increased image size
                const SizedBox(height: 30),
                const Text(
                  'Order\nYour Meal!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 48, // Increased font size
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/login');
                    // Implement your navigation or functionality
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 20), // Adjusted padding
                  ),
                  child: const Text('Get Started',
                      style: TextStyle(fontSize: 20)), // Increased text size
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 217, 64, 64),
      body: Center(
        // Center the content for larger screens
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 20.w), // Limit the max width
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 48.0), // Increase padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                // Image.asset('images/pizza.jpeg',
                //     height: 150), // Increased image size
                const SizedBox(height: 30),
                Image.asset('images/pizza.jpeg',
                    height: 0.5 *
                        MediaQuery.of(context)
                            .size
                            .height), // Increased image size
                const SizedBox(height: 30),
                Text(
                  'Order Your Meal!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 23, // Increased font size
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
                          horizontal: 15, vertical: 15),
                      fixedSize: Size(80.w, 15.h) // Adjusted padding
                      ),
                  child: Text('Get Started',
                      style: TextStyle(fontSize: 23)), // Increased text size
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

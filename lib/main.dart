import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Admin.dart';
import 'ViewAllUSer.dart';
import 'Normal_user.dart';
import 'Staff_dashboard.dart';
import 'signup_screen.dart';
import 'auth_controller.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'Boys_Screen.dart';

 // Import Firebase Core
import 'package:flutter/foundation.dart';

void main() async {
  await GetStorage.init(); // Initialize GetStorage

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBw00xQwzUlYIgSDsPeWcA44Mwi3AgewoU",
  authDomain: "canteenpreorder-e7ea8.firebaseapp.com",
  databaseURL: "https://canteenpreorder-e7ea8-default-rtdb.firebaseio.com",
  projectId: "canteenpreorder-e7ea8",
  storageBucket: "canteenpreorder-e7ea8.appspot.com",
  messagingSenderId: "136012598953",
  appId: "1:136012598953:web:00b7366e76320c7377a3b8",
  measurementId: "G-NB8ZFCE9L6"
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authController = Get.put(AuthController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Home page',
      initialRoute: '/', // Set the initial route
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/normal', page: () => FoodAppHome()),
        GetPage(name: '/login', page: () => LoginScreen()), // Login screen route
        GetPage(name: '/signup', page: () => SignupScreen()),
        GetPage(name: '/admin', page: () => const AdminDashboardScreen()),
        GetPage(name: '/staff', page: () => StaffDashboardScreen()),
        GetPage(name: '/viewAllUsers', page: () => const UserListScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
// Add GetPage entries for other new screens as well 

         // Signup screen route
      ],
    );
  }
}

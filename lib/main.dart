import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../firebase_options.dart';

import 'presentation/admin.dart';
import 'presentation/view_all_users.dart';
import 'presentation/customer_dashboard.dart';
import 'presentation/staff_dashboard.dart';
import 'presentation/auth_view/signup_screen.dart';
import 'models/auth_service/auth_controller.dart';
import 'presentation/auth_view/login_screen.dart';
import 'presentation/welcome_screen.dart';
import 'presentation/menu_update.dart';

void main() async {
  await GetStorage.init(); // Initialize GetStorage

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        GetPage(
            name: '/login', page: () => LoginScreen()), // Login screen route
        GetPage(name: '/signup', page: () => SignupScreen()),
        GetPage(name: '/admin', page: () => const AdminDashboardScreen()),
        GetPage(name: '/staff', page: () => StaffDashboardScreen()),
        GetPage(name: '/viewAllUsers', page: () => const UserListScreen()),
        GetPage(name: '/menu_update', page: () => UploadImageScreen()),
// Add GetPage entries for other new screens as well

        // Signup screen route
      ],
    );
  }
}

// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presentation/admin.dart';
import '../../presentation/staff_dashboard.dart';
import 'auth_controller.dart';
import '../../presentation/auth_view/login_screen.dart';
import '../../presentation/customer_dashboard.dart';

class AuthCheck extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (authController.firebaseUser.value == null) {
          // User is not authenticated, show the login screen
          // ignore: avoid_print
          print('something is wrong with the login');
          return LoginScreen();
        } else {
          final userRole = authController.userRole.value;
          if (userRole == 'admin') {
            // User is an admin, show the admin screen
            return const AdminDashboardScreen();
          } else if (userRole == 'normal') {
            // User is a staff member, show the staff screen
            return StaffDashboardScreen();
          } else if (userRole == 'staff') {
            // User is a normal user, show the normal user screen
            return StaffDashboardScreen();
          }

          // Add a default return statement (e.g., redirect to a generic page)
          return LoginScreen(); // Or any other Widget to display by default
        }
      },
    );
  }
}

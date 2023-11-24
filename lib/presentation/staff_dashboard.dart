// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../models/auth_service/auth_controller.dart';
import 'package:get/get.dart';

class StaffDashboardScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  StaffDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staff Dashboard'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            authController.signOut();
          },
          child: const Text('Sign Out'),
        ),
      ),
    );
  }
}

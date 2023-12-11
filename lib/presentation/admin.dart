// ignore_for_file: avoid_print, file_names, unused_local_variable

import 'package:canteen_preorderapp/presentation/profile_screen.dart';
import 'package:canteen_preorderapp/presentation/view_all_users.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:canteen_preorderapp/models/auth_service/auth_controller.dart';

class AdminDashboardScreen extends GetView<AuthController> {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 229, 229),
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 350,
            color: Color.fromARGB(
                255, 92, 9, 9), // You can set your desired sidebar color
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Sidebar Title
                Text(
                  'Admin Dashboard',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                // // Add sidebar items here
                Container(height: 500, child: SfProfileScreen())
              ],
            ),
          ),
          // Main content
          Expanded(
              child: Container(
            color: Color.fromARGB(255, 92, 9, 9),
            child: UserListScreen(),
          )),
        ],
      ),
    );
  }
}

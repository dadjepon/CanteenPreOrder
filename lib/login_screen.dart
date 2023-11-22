// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';
import 'auth_service.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  void login() async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      final result = await AuthService().signIn(email, password);

      if (result != null) {
        final user = result['user'];
        final role = result['role'];

        if (user != null && role != null) {
          await authController.fetchUserData(user.uid);
          if (role == 'admin') {
            Get.offAllNamed('/admin'); // Admin route
          } else if (role == 'staff') {
            Get.offAllNamed('/staff'); // Staff route
          } else {
            Get.offAllNamed('/normal'); // Normal user route
          }
        }
      } else {
        Get.snackbar(
          'Login Failed',
          'Please check your information and try again.',
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      print('Login error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

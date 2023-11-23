import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'auth_service.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FirebaseFirestore firestore = FirebaseFirestore.instance; // Firestore instance

  void signUp() async {
    if (formKey.currentState!.validate()) {
      final name = nameController.text;
      final email = emailController.text;
      const role = 'normal';
      final password = passwordController.text;
      final confirmPassword = confirmPasswordController.text;

      if (password == confirmPassword) {
        final result = await AuthService().signUp(email, password);

        if (result != null) {
          // Registration was successful
          // Save user information to Firestore
          await saveUserInfoToFirestore(name, email,role);

          // You can navigate to the next screen or perform any other actions
          // For example, navigate to the dashboard
          Get.offAllNamed('/normal');
        } else {
          // Registration failed
          // You can show an error message or handle it as needed
          Get.snackbar(
            'Registration Failed',
            'Please check your information and try again.',
            backgroundColor: Colors.red,
          );
        }
      } else {
        // Passwords do not match
        Get.snackbar(
          'Error',
          'Passwords do not match.',
          backgroundColor: Colors.red,
        );
      }
    }
  }

  Future<void> saveUserInfoToFirestore(String name, String email, String role) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await firestore.collection('users').doc(user.uid).set({
          'name': name,
          'email': email,
          'role': role
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error saving user information to Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  decoration: const InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: signUp,
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

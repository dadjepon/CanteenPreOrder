// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Rx<User?> firebaseUser = Rx<User?>(null);
  RxString userRole = ''.obs;

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(userStream());
  }

  Stream<User?> userStream() {
    return _auth.authStateChanges();
  }

  Future<void> fetchUserData(String userId) async {
    try {
      final userData = await firestore.collection('users').doc(userId).get();
      final data = userData.data() as Map<String, dynamic>;
      userRole.value = data['role'] ?? 'normal';
    } catch (e) {
      print('Error fetching user data: $e');
      // Handle the error, e.g., show an error message to the user.
    }
  }

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // User is signed in, fetch user data
        await fetchUserData(userCredential.user!.uid);
      }

      return userCredential;
    } catch (e) {
      print('Login error: $e');
      // Show a user-friendly error message
      Get.snackbar(
        'Login Failed',
        'An error occurred during login. Please try again.',
        backgroundColor: Colors.red,
      );
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

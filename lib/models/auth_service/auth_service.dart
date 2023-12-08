// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> signIn(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      final user = _auth.currentUser;

      if (user != null) {
        final userData =
            await firestore.collection('usersCollection').doc(user.uid).get();

        final data = userData.data() as Map<String, dynamic>;

        final role = data['role'] ?? 'normal';
        return {'user': user, 'role': role};
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
    return null;
  }

  Future<Map<String, dynamic>?> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = _auth.currentUser;
      if (user != null) {
        // You can add additional user data to the Firestore database if needed
        await firestore.collection('usersCollection').doc(user.uid).set({
          'role': 'normal', // Set the default role or other user data
        });

        return {
          'user': user,
          'role': 'normal'
        }; // You can change the default role here
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

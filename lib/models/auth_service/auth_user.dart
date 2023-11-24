import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final String id;
  final String email;
  const AuthUser({
    required this.id,
    required this.email,
  });

  //  factory method that creates an instance of the AuthUser class by taking a User object from Firebase Authentication
  factory AuthUser.fromFirebase(User user) => AuthUser(
        email: user.email!,
        id: user.uid,
      );
}

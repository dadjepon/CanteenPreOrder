import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String email;
  final String instID;
  final String phoneNumber;
  final String role;
  final String userId;

  User(
      {required this.name,
      required this.email,
      required this.instID,
      required this.phoneNumber,
      required this.role,
      required this.userId});

  factory User.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>? ?? {};

    return User(
      userId: doc.id,
      name: data['name'] ?? 'No Name', // Default value if 'name' is not found
      email:
          data['email'] ?? 'No Email', // Default value if 'email' is not found
      instID: data['instID'] ??
          'No Instituitional ID', // Default value if 'instituitional ID' is not found
      phoneNumber:
          data['phoneNumber'] ?? // Default value if 'phone number' is not found
              'No phone number',
      role: data['role'] ?? 'No Role', // Default value if 'role' is not found
    );
  }
}

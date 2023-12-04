// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:canteen_preorderapp/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class User {
//   final String name;
//   final String email;
//   final String role;

//   User({required this.name, required this.email, required this.role});

//   factory User.fromFirestore(DocumentSnapshot doc) {
//     Map<String, dynamic> data = doc.data() as Map<String, dynamic>? ?? {};
//     return User(
//       name: data['name'] ?? 'No Name',
//       email: data['email'] ?? 'No Email',
//       role: data['role'] ?? 'No Role',
//     );
//   }
// }

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<User> users = [];
  List<User> filteredUsers = [];
  String selectedRole = 'All'; // Default value to show all roles
  List<String> roles = ['All', 'admin', 'staff', 'normal']; // List of roles

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _loadUsers() async {
    FirebaseFirestore.instance
        .collection('userCollection')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        users =
            querySnapshot.docs.map((doc) => User.fromFirestore(doc)).toList();
        filteredUsers = List.from(users); // Initially, all users are shown
      });
    });
  }

  void _filterUsers(String role) {
    setState(() {
      if (role == 'All') {
        filteredUsers = List.from(users);
      } else {
        filteredUsers = users.where((user) => user.role == role).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedRole,
            onChanged: (String? newValue) {
              setState(() {
                selectedRole = newValue!;
                _filterUsers(selectedRole);
              });
            },
            items: roles.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredUsers[index].name),
                  subtitle: Text(
                      'Email: ${filteredUsers[index].email}, Role: ${filteredUsers[index].role}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

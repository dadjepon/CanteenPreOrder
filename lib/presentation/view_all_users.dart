// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:canteen_preorderapp/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<User> users = [];
  List<User> filteredUsers = [];
  String selectedRole = 'All'; // Default value to show all roles
  List<String> roles = ['All', 'admin', 'staff', 'normal']; // List of roles
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _loadUsers() async {
    FirebaseFirestore.instance
        .collection('usersCollection')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        users =
            querySnapshot.docs.map((doc) => User.fromFirestore(doc)).toList();
        filteredUsers = List.from(users); // Initially, all users are shown
      });
    });
  }

  void _filterUsers(String role, String query) {
    setState(() {
      if (role == 'All') {
        filteredUsers = List.from(users);
      } else {
        filteredUsers = users.where((user) => user.role == role).toList();
      }

      // Apply search filter
      filteredUsers = filteredUsers
          .where((user) =>
              user.name.toLowerCase().contains(query.toLowerCase()) ||
              user.email.toLowerCase().contains(query.toLowerCase()))
          .toList();
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
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (query) {
                setState(() {
                  _filterUsers(selectedRole, query);
                });
              },
              decoration: InputDecoration(
                hintText: ' Search ',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Role dropdown
          DropdownButton<String>(
            value: selectedRole,
            onChanged: (String? newValue) {
              setState(() {
                selectedRole = newValue!;
                _filterUsers(selectedRole, searchController.text);
              });
            },
            items: roles.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          // User list
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

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}

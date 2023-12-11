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

void _showCreateUserDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      TextEditingController nameController = TextEditingController();
      TextEditingController emailController = TextEditingController();
      TextEditingController instIDController = TextEditingController();
      TextEditingController phoneNumberController = TextEditingController();
      TextEditingController passwordController = TextEditingController();
      TextEditingController roleController = TextEditingController();
      TextEditingController companyController = TextEditingController();

      return AlertDialog(
        title: const Text('Create New User'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Name')),
              TextField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'Email')),
              TextField(
                  controller: instIDController,
                  decoration:
                      const InputDecoration(hintText: 'Instuitional ID')),
              TextField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(hintText: 'Phone Number')),
              TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(hintText: 'Password')),
              TextField(
                  controller: roleController,
                  decoration: const InputDecoration(hintText: 'Role')),
              TextField(
                  controller: companyController,
                  decoration:
                      const InputDecoration(hintText: 'Name of Company')),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Create'),
            onPressed: () {
              // Ensure the parameters are in the correct order when calling the function.
              _createNewUser(
                  nameController.text,
                  emailController.text,
                  passwordController.text,
                  roleController.text,
                  companyController.text,
                  phoneNumberController.text,
                  instIDController.text);
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Create'),
            onPressed: () {
              _createNewUser(
                  nameController.text,
                  emailController.text,
                  phoneNumberController.text,
                  instIDController.text,
                  passwordController.text,
                  roleController.text,
                  companyController.text);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void _createNewUser(String name, String email, String instID,
    String phoneNumber, String password, String role, String company) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    String userId = userCredential.user?.uid ?? '';

    if (userId.isNotEmpty) {
      // Store user details along with a flag indicating that password change is required
      await FirebaseFirestore.instance
          .collection('userCOllection')
          .doc(userId)
          .set({
        'name': name,
        'email': email,
        '': email,
        'role': role,
        'requiresPasswordChange': true,
        'company': company, // Flag for mandatory password change
      });

      print("User created successfully with email: $email");
    }
  } on FirebaseAuthException catch (e) {
    print("Firebase Auth Error: ${e.message}");
  } catch (e) {
    print("Error: $e");
  }
}

void deleteUser(String email) async {
  try {
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('deleteUser');
    final result = await callable.call(<String, dynamic>{
      'email': email,
    });
    print(result.data['message']);
  } catch (e) {
    print(e);
  }
}

void _showDeleteUserDialog(BuildContext context) {
  TextEditingController emailController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Delete User'),
        content: TextField(
          controller: emailController,
          decoration: const InputDecoration(hintText: 'Enter User Email'),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Delete'),
            onPressed: () {
              // Pass the email to the confirmation dialog
              _showDeleteConfirmationDialog(context, emailController.text);
            },
          ),
        ],
      );
    },
  );
}

void _showDeleteConfirmationDialog(BuildContext context, String email) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm Deletion'),
        content: const Text('Are you sure you want to delete this user?'),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              deleteUser(email); // Use the passed email
              Navigator.of(context).pop(); // Close the confirmation dialog
              Navigator.of(context).pop(); // Close the delete user dialog
            },
          ),
        ],
      );
    },
  );
}


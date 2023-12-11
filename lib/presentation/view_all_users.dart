// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:canteen_preorderapp/models/auth_service/auth_exceptions.dart';
import 'package:canteen_preorderapp/models/database_service.dart';

import 'package:canteen_preorderapp/models/user_model.dart' as userModel;
import 'package:canteen_preorderapp/widgets/custom_dialogs/show_error_dialog.dart';
import 'package:canteen_preorderapp/widgets/custom_text_field.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<userModel.User> users = [];
  List<userModel.User> filteredUsers = [];
  String selectedRole = 'All'; // Default value to show all roles
  List<String> roles = ['All', 'admin', 'staff', 'normal']; // List of roles
  TextEditingController searchController = TextEditingController();

  late final DatabaseService _databaseService;

  @override
  void initState() {
    _databaseService = DatabaseService();
    super.initState();
    _loadUsers();
  }

  void _loadUsers() async {
    FirebaseFirestore.instance
        .collection('usersCollection')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        users = querySnapshot.docs
            .map((doc) => userModel.User.fromFirestore(doc))
            .toList();
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
        title: Row(
          children: [
            const Text(
              'User List',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              width: 700,
            ),
            IconButton(
                color: Colors.white,
                onPressed: () => _showCreateUserDialog(context),
                icon: Icon(Icons.add)),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 92, 9, 9),
        toolbarHeight: 61,
        // leading: Icon(Icons.menu),
      ),
      bottomNavigationBar: Container(
        height: 35,
        child: BottomAppBar(
          color: Color.fromARGB(255, 92, 9, 9),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(15.0),
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
                  return Card(
                    color: Colors.white70,
                    margin:
                        const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(filteredUsers[index].name),
                          Spacer(),
                          IconButton(
                              color: Colors.black,
                              onPressed: () => _showDeleteUserDialog(
                                  context,
                                  filteredUsers[index].email,
                                  filteredUsers[index].userId),
                              icon: Icon(Icons.delete)),
                        ],
                      ),
                      subtitle: Text(
                          'Email: ${filteredUsers[index].email}, Role: ${filteredUsers[index].role}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  _showCreateUserDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController nameController = TextEditingController();
        TextEditingController emailController = TextEditingController();
        TextEditingController instIDController = TextEditingController();
        TextEditingController phoneNumberController = TextEditingController();
        TextEditingController cafeteriaController = TextEditingController();
        TextEditingController passwordController = TextEditingController();
        TextEditingController confirmPasswordController =
            TextEditingController();
        TextEditingController roleController = TextEditingController();

        return AlertDialog(
          insetPadding: EdgeInsets.all(10),
          contentPadding: EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 50.0),
          title: const Text('Registration Form'),
          content: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    child: Image(
                      image:
                          Image.asset('images/canteenpreorderlogo.png').image,
                    ),
                    height: 150,
                  ),

                  //Email input field
                  CustomTextField(
                    labelText: "Full Name",
                    fieldController: nameController,
                    keyboardType: TextInputType.text,
                  ),

                  CustomTextField(
                    labelText: "Email Address",
                    fieldController: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  CustomTextField(
                    labelText: "Role",
                    fieldController: roleController,
                    keyboardType: TextInputType.text,
                  ),
                  CustomTextField(
                    labelText: "Cafeteria",
                    fieldController: cafeteriaController,
                    keyboardType: TextInputType.text,
                  ),
                  CustomTextField(
                    labelText: "Phone Number ",
                    fieldController: phoneNumberController,
                    keyboardType: TextInputType.number,
                  ),
                  CustomTextField(
                    labelText: "Instituition ID ",
                    fieldController: instIDController,
                    keyboardType: TextInputType.number,
                  ),

                  //password input field
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    child: TextField(
                      style: GoogleFonts.ubuntu(
                          fontSize: 15, fontWeight: FontWeight.bold),
                      controller: passwordController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    child: Container(
                      height: 40,
                      width: 600,
                      child: TextField(
                        style: GoogleFonts.ubuntu(
                            fontSize: 15, fontWeight: FontWeight.bold),
                        controller: confirmPasswordController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirm Password',
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 105, 4, 4),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: TextButton(
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        onPressed: () async {
                          final String email = emailController.text;
                          final String phoneNumber = phoneNumberController.text;
                          final String instID = instIDController.text;
                          final String role = roleController.text;
                          final String password = passwordController.text;
                          final String cafeteria = cafeteriaController.text;
                          final String confirmPass =
                              confirmPasswordController.text;
                          final String fullName = nameController.text;
                          final RegExp emailRegex = RegExp(
                              r'^\w+([.-]?\w+)*@(ashesi\.edu\.gh|gmail\.com|aucampus\.onmicrosoft\.com)$');

                          if (email.isEmpty ||
                              confirmPass.isEmpty ||
                              instID.isEmpty ||
                              phoneNumber.isEmpty ||
                              password.isEmpty ||
                              cafeteria.isEmpty ||
                              role.isEmpty ||
                              fullName.isEmpty) {
                            await showErrorDialog(
                              context,
                              'All fields are required, fill empty fields',
                            );
                          } else if (emailRegex.hasMatch(email) == false) {
                            emailController.clear();
                            await showErrorDialog(
                              context,
                              "Invalid email address",
                            );
                          } else if (fullName.length > 25) {
                            await showErrorDialog(
                              context,
                              "Name is too long, try initials",
                            );
                          } else if (confirmPass != password) {
                            await showErrorDialog(
                              context,
                              "Passwords do not match",
                            );
                          } else {
                            try {
                              final snackbar = SnackBar(
                                duration: const Duration(seconds: 5),
                                content: Text(
                                  'Almost done, Please wait...',
                                  style: GoogleFonts.ubuntu(
                                    color: Color.fromARGB(255, 105, 4, 4),
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                elevation: 5,
                              );
                            } on WeakPasswordAuthException {
                              await showErrorDialog(
                                context,
                                "Weak Password",
                              );
                            } on EmailAlreadyInUseAuthException {
                              await showErrorDialog(
                                context,
                                "Email is already in use",
                              );
                            } on InvalidEmailAuthException {
                              await showErrorDialog(
                                context,
                                "Invalid email",
                              );
                            } on GenericAuthException {
                              debugPrint(password);
                              debugPrint(email);
                              await showErrorDialog(
                                context,
                                "Failed to register",
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ]),
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
                _createNewUser(
                    nameController.text,
                    emailController.text,
                    phoneNumberController.text,
                    instIDController.text,
                    passwordController.text,
                    roleController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _createNewUser(String name, String email, String instID, String phoneNumber,
      String password, String role) async {
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
            .collection('usersCollection')
            .doc(userId)
            .set({
          'name': name,
          'email': email,
          '': email,
          'role': role,
          'requiresPasswordChange': true, // Flag for mandatory password change
        });

        print("User created successfully with email: $email");
      }
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Error: ${e.message}");
    } catch (e) {
      print("Error: $e");
    }
  }

  deleteUser(String email, String userId) async {
    try {
      HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('deleteUser');
      final result = await callable.call(<String, dynamic>{
        'email': email,
      });
      print(result.data['message']);
      await _databaseService.removeUser(userId);
    } catch (e) {
      print(e);
    }
  }

  _showDeleteUserDialog(BuildContext context, String email, String userId) {
    // TextEditingController emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete User'),
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
                _showDeleteConfirmationDialog(context, email, userId);
              },
            ),
          ],
        );
      },
    );
  }

  _showDeleteConfirmationDialog(
      BuildContext context, String email, String userId) {
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
                deleteUser(email, userId); // Use the passed email
                Navigator.of(context).pop(); // Close the confirmation dialog
                Navigator.of(context).pop(); // Close the delete user dialog
              },
            ),
          ],
        );
      },
    );
  }
}

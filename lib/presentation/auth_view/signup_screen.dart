import 'package:canteen_preorderapp/models/auth_service/auth_exceptions.dart';
import 'package:canteen_preorderapp/widgets/custom_dialogs/show_error_dialog.dart';
import 'package:canteen_preorderapp/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:google_fonts/google_fonts.dart';
import '../../models/auth_service/auth_service.dart';
import 'package:canteen_preorderapp/models/database_service.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final DatabaseService _dataService;

  @override
  void initState() {
    _dataService = DatabaseService();
    super.initState();
  }

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController instIDController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController dobController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // Firestore instance
  void signUp() async {
    if (formKey.currentState!.validate()) {
      final name = nameController.text;
      final email = emailController.text;
      final instID = instIDController.text;
      final phoneNumber = phoneNumberController.text;
      const role = 'normal';
      final password = passwordController.text;
      final confirmPassword = confirmPasswordController.text;

      if (password == confirmPassword) {
        final result = await AuthService().signUp(email, password);

        if (result != null) {
          // Registration was successful
          // Save user information to Firestore
          final user = FirebaseAuth.instance.currentUser;
          await _dataService.saveUserInfoToFirestore(
              name, email, instID, phoneNumber, role, user);

          // You can navigate to the next screen or perform any other actions
          // For example, navigate to the dashboard
          Get.offAllNamed('/normal');
        } else {
          // Registration failed
          // You can show an error message or handle it as needed
          Get.snackbar(
            'Registration Failed',
            'Please check your information and try again.',
            backgroundColor: Color(0xFF6B0808),
          );
        }
      } else {
        // Passwords do not match
        Get.snackbar(
          'Error',
          'Passwords do not match.',
          backgroundColor: Color(0xFF6B0808),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 105, 4, 4),
        body: Center(
            child: Form(
          key: formKey,
          child: Card(
            shadowColor: Colors.white,
            // margin: const EdgeInsets.only(top: 5.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
            color: Theme.of(context).cardColor,
            elevation: 18,
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                maxHeight: double.infinity,
                maxWidth: MediaQuery.of(context).size.width * 0.5,
              ),
              child: SingleChildScrollView(
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
                    Center(
                      child: Text(
                        "Registration Form",
                        style: GoogleFonts.ubuntu(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
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
                          onPressed: () async {

                             final String dob = dobController.text;

                            final String email = emailController.text;
                            final String phoneNumber =
                                phoneNumberController.text;
                            final String instID = instIDController.text;
                            final String password = passwordController.text;
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
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackbar);
                                signUp();

                                Get.toNamed('/login');
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
                          child: const Text(
                            'Sign up',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),

                    //adding button to switch to login screen
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/login');
                      },
                      child: const Text(
                        'Already have an account? Log in',
                        style: TextStyle(
                            color: Color.fromARGB(255, 105, 4, 4),
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )));
  }
}

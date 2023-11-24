// ignore_for_file: avoid_print
import 'package:canteen_preorderapp/models/auth_service/auth_exceptions.dart';
import 'package:canteen_preorderapp/models/auth_service/firebase_service.dart';
import 'package:canteen_preorderapp/widgets/custom_dialogs/show_error_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/auth_service/auth_controller.dart';
import '../../models/auth_service/auth_service.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  void login() async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      final result = await AuthService().signIn(email, password);

      if (result != null) {
        final user = result['user'];
        final role = result['role'];

        if (user != null && role != null) {
          await authController.fetchUserData(user.uid);
          if (role == 'admin') {
            Get.offAllNamed('/admin'); // Admin route
          } else if (role == 'staff') {
            Get.offAllNamed('/staff'); // Staff route
          } else {
            Get.offAllNamed('/normal'); // Normal user route
          }
        }
      } else {
        Get.snackbar(
          'Login Failed',
          'Please check your information and try again.',
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      print('Login error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 105, 4, 4),
      body: Center(
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
                  const SizedBox(
                    height: 50,
                  ),

                  Center(
                    child: Text(
                      "Welcome",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 5),
                    child: TextField(
                      style: GoogleFonts.ubuntu(
                          fontSize: 15, fontWeight: FontWeight.bold),
                      controller: emailController,
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "Email Address",
                      ),
                    ),
                  ),

                  //password input field
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 30, bottom: 0),
                    child: TextField(
                      controller: passwordController,
                      style: GoogleFonts.ubuntu(
                          fontSize: 15, fontWeight: FontWeight.bold),
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),

                  //Register button and forgot passwod button

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 30, bottom: 0),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 105, 4, 4),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: TextButton(
                        onPressed: () async {
                          final email = emailController.text;
                          final password = passwordController.text;
                          final RegExp emailRegex = RegExp(
                              r'^\w+([.-]?\w+)*@(ashesi\.edu\.gh|gmail\.com|aucampus\.onmicrosoft\.com)$');

                          if (email.isEmpty || password.isEmpty) {
                            await showErrorDialog(
                              context,
                              "All fields are required",
                            );
                          } else if (emailRegex.hasMatch(email) == false) {
                            await showErrorDialog(
                              context,
                              "Invalid email address",
                            );
                          } else {
                            try {
                              final snackbar = SnackBar(
                                // duration: const Duration(seconds: 5),
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
                              await FirebaseAuthService().logIn(
                                email: email,
                                password: password,
                              );
                              Get.toNamed('/normal');
                            } on UserNotFoundAuthException {
                              await showErrorDialog(
                                context,
                                "User not found",
                              );
                            } on WrongPasswordAuthException {
                              await showErrorDialog(
                                context,
                                "Wrong password",
                              );
                            } on GenericAuthException {
                              await showErrorDialog(
                                context,
                                'Authentication error',
                              );
                            }
                          }
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),

                  //adding empty space
                  const SizedBox(
                    height: 50,
                  ),

                  //adding button to switch to register screen
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/signup');
                    },
                    child: const Text(
                      'Not registered yet? Sign up',
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
      ),
    );
  }
}

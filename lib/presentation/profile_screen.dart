// import 'package:canteen_preorderapp/core/app_export.dart';
// import 'package:canteen_preorderapp/models/auth_service/firebase_service.dart';
// import 'package:canteen_preorderapp/models/customer_model.dart';
// import 'package:canteen_preorderapp/models/database_service.dart';
// import 'package:canteen_preorderapp/widgets/custom_dialogs/show_logout_dialog.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// // ignore_for_file: must_be_immutable
// class SfProfileScreen extends StatefulWidget {
//   SfProfileScreen({Key? key}) : super(key: key);
//   @override
//   State<SfProfileScreen> createState() => _SfProfileScreenState();
// }

// class _SfProfileScreenState extends State<SfProfileScreen> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController roleController = TextEditingController();

//   late final DatabaseService _dataService;

//   @override
//   void initState() {
//     _dataService = DatabaseService();
//     super.initState();
//   }

//   var priv = "admin";
//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);

//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: FutureBuilder(
//           future: _dataService.getUser(
//               userId: FirebaseAuthService().currentUser!.id),
//           builder: (context, snapshot) {
//             switch (snapshot.connectionState) {
//               case ConnectionState.active:
//               case ConnectionState.waiting:
//               case ConnectionState.done:
//                 if (snapshot.hasData) {
//                   final CustomerItem profileData =
//                       snapshot.data as CustomerItem;

//                   nameController.text = profileData.customerName;

//                   emailController.text = profileData.customerEmail;
//                   roleController.text = profileData.role;

//                   return Column(
//                     children: [
//                       SizedBox(
//                         height: 550,
//                         child: Expanded(
//                           child: Container(
//                             color: Colors.white54,
//                             child: Column(
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: const [
//                                     CircleAvatar(
//                                       maxRadius: 65,
//                                       backgroundImage: AssetImage(
//                                           "images/image_not_found.png"),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       profileData.customerName,
//                                       style: GoogleFonts.ubuntu(
//                                           fontWeight: FontWeight.w900,
//                                           fontSize: 26),
//                                     )
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       profileData.customerEmail,
//                                       style: GoogleFonts.ubuntu(fontSize: 20),
//                                     )
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       profileData.customerPhoneNumber,
//                                       style: GoogleFonts.ubuntu(fontSize: 20),
//                                     )
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   height:
//                                       0.42 * MediaQuery.of(context).size.height,
//                                   child: ListView(
//                                     children: [
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       profileData.role != priv
//                                           ? Card(
//                                               color: Colors.white70,
//                                               margin: const EdgeInsets.only(
//                                                   left: 35,
//                                                   right: 35,
//                                                   bottom: 10),
//                                               shape: RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           30)),
//                                               child: ListTile(
//                                                 leading: Icon(Icons.history,
//                                                     color: Color(0xFF6B0808)),
//                                                 title: Text(
//                                                   'Purchase History',
//                                                   style: GoogleFonts.ubuntu(
//                                                       fontSize: 18,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 ),
//                                                 trailing: Icon(
//                                                   Icons
//                                                       .arrow_forward_ios_outlined,
//                                                   color: Color(0xFF6B0808),
//                                                 ),
//                                               ),
//                                             )
//                                           : Text(""),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       profileData.role != priv
//                                           ? GestureDetector(
//                                               onTap: () {
//                                                 showDialog(
//                                                   context: context,
//                                                   builder:
//                                                       (BuildContext context) {
//                                                     return AlertDialog(
//                                                       content: SizedBox(
//                                                           width: 0.1 *
//                                                               MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .width,
//                                                           child: Column(
//                                                             mainAxisSize:
//                                                                 MainAxisSize
//                                                                     .min,
//                                                             children: [
//                                                               Text(
//                                                                   "Momo Number: ${profileData.customerPhoneNumber}"),
//                                                               Text(
//                                                                   "Bank Account: N/A"),
//                                                             ],
//                                                           )),
//                                                       contentPadding:
//                                                           const EdgeInsets.all(
//                                                               10),
//                                                       title: Center(
//                                                         child: Text(
//                                                             "Payment Details"),
//                                                       ),
//                                                       actions: [
//                                                         TextButton(
//                                                           onPressed: () =>
//                                                               Navigator.pop(
//                                                                   context),
//                                                           child: Text('Close',
//                                                               style: GoogleFonts.ubuntu(
//                                                                   fontSize: 15,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .bold,
//                                                                   color: Color(
//                                                                       0xFF6B0808))),
//                                                         ),
//                                                         TextButton(
//                                                           onPressed: () {},
//                                                           child: Text('Edit',
//                                                               style: GoogleFonts.ubuntu(
//                                                                   fontSize: 15,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .bold,
//                                                                   color: Color(
//                                                                       0xFF6B0808))),
//                                                         ),
//                                                       ],
//                                                     );
//                                                   },
//                                                 );
//                                               },
//                                               child: Card(
//                                                 color: Colors.white70,
//                                                 margin: const EdgeInsets.only(
//                                                     left: 35,
//                                                     right: 35,
//                                                     bottom: 10),
//                                                 shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             30)),
//                                                 child: ListTile(
//                                                   leading: Icon(
//                                                     Icons.privacy_tip_sharp,
//                                                     color: Color(0xFF6B0808),
//                                                   ),
//                                                   title: Text(
//                                                     'Payment Details',
//                                                     style: GoogleFonts.ubuntu(
//                                                         fontSize: 18,
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                   ),
//                                                   trailing: Icon(
//                                                       Icons
//                                                           .arrow_forward_ios_outlined,
//                                                       color: Color(0xFF6B0808)),
//                                                 ),
//                                               ),
//                                             )
//                                           : Text(""),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           String htmlContent = '''
//                                                       <!DOCTYPE html>
//                                                       <html>
//                                                       <head>
//                                                         <meta charset="UTF-8">
//                                                         <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
//                                                         <title>Landbot | Convert a Landing Page into a Chatbot</title>
//                                                       </head>
//                                                       <body>
//                                                         <script SameSite="None; Secure" src="https://cdn.landbot.io/landbot-3/landbot-3.0.0.js"></script>
//                                                         <script>
//                                                           var myLandbot = new Landbot.Fullpage({
//                                                             configUrl: 'https://storage.googleapis.com/landbot.online/v3/H-2071934-XARE0WJVR859N4JH/index.json',
//                                                           });
//                                                         </script>
//                                                       </body>
//                                                       </html>
//                                                     ''';
//                                           showDialog(
//                                             context: context,
//                                             builder: (BuildContext context) {
//                                               return AlertDialog(
//                                                 content: SizedBox(
//                                                   width: 0.7 *
//                                                       MediaQuery.of(context)
//                                                           .size
//                                                           .width,
//                                                   child: WebViewWidget(
//                                                     controller:
//                                                         WebViewController()
//                                                           ..loadHtmlString(
//                                                               htmlContent),
//                                                   ),
//                                                 ),
//                                                 contentPadding:
//                                                     const EdgeInsets.all(10),
//                                                 title: Text("Contact Support"),
//                                                 actions: [
//                                                   TextButton(
//                                                     onPressed: () =>
//                                                         Navigator.pop(context),
//                                                     child: Text('Close'),
//                                                   ),
//                                                 ],
//                                               );
//                                             },
//                                           );
//                                         },
//                                         child: Card(
//                                           color: Colors.white70,
//                                           margin: const EdgeInsets.only(
//                                               left: 35, right: 35, bottom: 10),
//                                           shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(30)),
//                                           child: ListTile(
//                                             leading: Icon(Icons.help_outline,
//                                                 color: Color(0xFF6B0808)),
//                                             title: Text(
//                                               'Help & Support',
//                                               style: GoogleFonts.ubuntu(
//                                                   fontSize: 18,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             trailing: Icon(
//                                               Icons.arrow_forward_ios_outlined,
//                                               color: Color(0xFF6B0808),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       GestureDetector(
//                                         onTap: () async {
//                                           final shouldLogout =
//                                               await showLogOutDialog(context);

//                                           if (shouldLogout) {
//                                             await FirebaseAuthService()
//                                                 .logOut();

//                                             Get.toNamed("/login");
//                                           }
//                                         },
//                                         child: Card(
//                                           color: Colors.white70,
//                                           margin: const EdgeInsets.only(
//                                               left: 35, right: 35, bottom: 10),
//                                           shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(30)),
//                                           child: ListTile(
//                                             leading: Icon(
//                                               Icons.logout,
//                                               color: Color(0xFF6B0808),
//                                             ),
//                                             title: Text(
//                                               'Logout',
//                                               style: GoogleFonts.ubuntu(
//                                                   fontSize: 18,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             trailing: Icon(
//                                                 Icons
//                                                     .arrow_forward_ios_outlined,
//                                                 color: Color(0xFF6B0808)),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 } else {
//                   return const CircularProgressIndicator();
//                 }

//               default:
//                 debugPrint('default');

//                 return const CircularProgressIndicator();
//             }
//           },
//         ),
//       ),
//     );
//   }

//   /// Navigates back to the previous screen.

//   onTapArrowLeft(BuildContext context) {
//     Navigator.pop(context);
//   }
// }

import 'package:canteen_preorderapp/core/app_export.dart';
import 'package:canteen_preorderapp/models/auth_service/firebase_service.dart';
import 'package:canteen_preorderapp/models/customer_model.dart';
import 'package:canteen_preorderapp/models/database_service.dart';
import 'package:canteen_preorderapp/widgets/custom_dialogs/show_logout_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore_for_file: must_be_immutable
class SfProfileScreen extends StatefulWidget {
  SfProfileScreen({Key? key}) : super(key: key);
  @override
  State<SfProfileScreen> createState() => _SfProfileScreenState();
}

class _SfProfileScreenState extends State<SfProfileScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  late final DatabaseService _dataService;

  @override
  void initState() {
    _dataService = DatabaseService();
    super.initState();
  }

  var priv = "admin";
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _dataService.getUser(
              userId: FirebaseAuthService().currentUser!.id),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.waiting:
              case ConnectionState.done:
                if (snapshot.hasData) {
                  final CustomerItem profileData =
                      snapshot.data as CustomerItem;

                  nameController.text = profileData.customerName;

                  emailController.text = profileData.customerEmail;
                  roleController.text = profileData.role;

                  return SizedBox(
                    height: 550,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              maxRadius: 65,
                              backgroundImage:
                                  AssetImage("images/image_not_found.png"),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              profileData.customerName,
                              style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.w900, fontSize: 26),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              profileData.customerEmail,
                              style: GoogleFonts.ubuntu(fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              profileData.customerPhoneNumber,
                              style: GoogleFonts.ubuntu(fontSize: 20),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 0.42 * MediaQuery.of(context).size.height,
                          child: ListView(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              profileData.role != priv
                                  ? Card(
                                      color: Colors.white70,
                                      margin: const EdgeInsets.only(
                                          left: 35, right: 35, bottom: 10),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: ListTile(
                                        leading: Icon(Icons.history,
                                            color: Color(0xFF6B0808)),
                                        title: Text(
                                          'Purchase History',
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: Color(0xFF6B0808),
                                        ),
                                      ),
                                    )
                                  : Text(""),
                              const SizedBox(
                                height: 10,
                              ),
                              profileData.role != priv
                                  ? GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: SizedBox(
                                                  width: 0.1 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                          "Momo Number: ${profileData.customerPhoneNumber}"),
                                                      Text("Bank Account: N/A"),
                                                    ],
                                                  )),
                                              contentPadding:
                                                  const EdgeInsets.all(10),
                                              title: Center(
                                                child: Text("Payment Details"),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: Text('Close',
                                                      style: GoogleFonts.ubuntu(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                              0xFF6B0808))),
                                                ),
                                                TextButton(
                                                  onPressed: () {},
                                                  child: Text('Edit',
                                                      style: GoogleFonts.ubuntu(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                              0xFF6B0808))),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Card(
                                        color: Colors.white70,
                                        margin: const EdgeInsets.only(
                                            left: 35, right: 35, bottom: 10),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.privacy_tip_sharp,
                                            color: Color(0xFF6B0808),
                                          ),
                                          title: Text(
                                            'Payment Details',
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          trailing: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: Color(0xFF6B0808)),
                                        ),
                                      ),
                                    )
                                  : Text(""),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  String htmlContent = '''
                                              <!DOCTYPE html>
                                              <html>
                                              <head>
                                                <meta charset="UTF-8">
                                                <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
                                                <title>Landbot | Convert a Landing Page into a Chatbot</title>
                                              </head>
                                              <body>
                                                <script SameSite="None; Secure" src="https://cdn.landbot.io/landbot-3/landbot-3.0.0.js"></script>
                                                <script>
                                                  var myLandbot = new Landbot.Fullpage({
                                                    configUrl: 'https://storage.googleapis.com/landbot.online/v3/H-2071934-XARE0WJVR859N4JH/index.json',
                                                  });
                                                </script>
                                              </body>
                                              </html>
                                            ''';
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: SizedBox(
                                          width: 0.7 *
                                              MediaQuery.of(context).size.width,
                                          child: WebViewWidget(
                                            controller: WebViewController()
                                              ..loadHtmlString(htmlContent),
                                          ),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.all(10),
                                        title: Text("Contact Support"),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text('Close'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Card(
                                  color: Colors.white70,
                                  margin: const EdgeInsets.only(
                                      left: 35, right: 35, bottom: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: ListTile(
                                    leading: Icon(Icons.help_outline,
                                        color: Color(0xFF6B0808)),
                                    title: Text(
                                      'Help & Support',
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Color(0xFF6B0808),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  final shouldLogout =
                                      await showLogOutDialog(context);

                                  if (shouldLogout) {
                                    await FirebaseAuthService().logOut();

                                    Get.toNamed("/login");
                                  }
                                },
                                child: Card(
                                  color: Colors.white70,
                                  margin: const EdgeInsets.only(
                                      left: 35, right: 35, bottom: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.logout,
                                      color: Color(0xFF6B0808),
                                    ),
                                    title: Text(
                                      'Logout',
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    trailing: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Color(0xFF6B0808)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }

              default:
                debugPrint('default');

                return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  /// Navigates back to the previous screen.

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}

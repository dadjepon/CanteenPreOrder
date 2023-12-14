import 'package:canteen_preorderapp/core/app_export.dart';
import 'package:canteen_preorderapp/models/auth_service/firebase_service.dart';
import 'package:canteen_preorderapp/models/customer_model.dart';
import 'package:canteen_preorderapp/models/database_service.dart';
import 'package:canteen_preorderapp/widgets/custom_dialogs/show_logout_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

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

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
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
                        height: 500,
                        child: Expanded(
                          child: Container(
                            color: Colors.white54,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    CircleAvatar(
                                      maxRadius: 65,
                                      backgroundImage: AssetImage(
                                          "images/image_not_found.png"),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      profileData.customerName,
                                      style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 26),
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
                                  height: 15,
                                ),
                                Container(
                                  child: Expanded(
                                      child: ListView(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      profileData.role != priv
                                          ? Card(
                                              color: Colors.white70,
                                              margin: const EdgeInsets.only(
                                                  left: 35,
                                                  right: 35,
                                                  bottom: 10),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: ListTile(
                                                leading: Icon(Icons.history,
                                                    color: Color(0xFF6B0808)),
                                                title: Text(
                                                  'Purchase History',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                trailing: Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color: Color(0xFF6B0808),
                                                ),
                                              ),
                                            )
                                          : Text(""),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      profileData.role != priv
                                          ? Card(
                                              color: Colors.white70,
                                              margin: const EdgeInsets.only(
                                                  left: 35,
                                                  right: 35,
                                                  bottom: 10),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: ListTile(
                                                leading: Icon(
                                                  Icons.privacy_tip_sharp,
                                                  color: Color(0xFF6B0808),
                                                ),
                                                title: Text(
                                                  'Payment Details',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                trailing: Icon(
                                                    Icons
                                                        .arrow_forward_ios_outlined,
                                                    color: Color(0xFF6B0808)),
                                              ),
                                            )
                                          : Text(""),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Card(
                                        color: Colors.white70,
                                        margin: const EdgeInsets.only(
                                            left: 35, right: 35, bottom: 10),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
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
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          final shouldLogout =
                                              await showLogOutDialog(context);

                                          if (shouldLogout) {
                                            await FirebaseAuthService()
                                                .logOut();

                                            Get.toNamed("/login");
                                          }
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
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                color: Color(0xFF6B0808)),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                                )
                              ],
                            ),
                          ),
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
        ));
  }

  /// Navigates back to the previous screen.

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}

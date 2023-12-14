// import 'package:canteen_preorderapp/core/app_export.dart';
// import 'package:canteen_preorderapp/models/database_service.dart';

// class AdProfileScreen extends StatefulWidget {
//   AdProfileScreen({Key? key}) : super(key: key);
//   @override
//   State<AdProfileScreen> createState() => _AdProfileScreenState();
// }

// class _AdProfileScreenState extends State<AdProfileScreen> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController roleCntroller = TextEditingController();

//   late final DatabaseService _dataService;
//   void initState() {
//     _dataService = DatabaseService();
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);

//     return  Scaffold(





// return SizedBox(
//                         height: 1000,
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
//                                   height: 20,
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
import 'package:canteen_preorderapp/core/app_export.dart';
import 'package:canteen_preorderapp/presentation/current_orders.dart';
import 'package:canteen_preorderapp/presentation/view_all_users.dart';
import 'package:sizer/sizer.dart';

import 'package:sizer/sizer.dart';

void main() async {
  await GetStorage.init(); // Initialize GetStorage

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
  // runApp(MyHomePage());
}

class MyApp extends StatelessWidget {
  final authController = Get.put(AuthController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (
      context,
      orientation,
      deviceType,
    ) {
      return GetMaterialApp(
        title: 'Home page',
        initialRoute: '/', // Set the initial route
        getPages: [
          GetPage(name: '/', page: () => const SplashScreen()),
          GetPage(name: '/normal', page: () => FoodAppHome()),
          GetPage(
              name: '/login', page: () => LoginScreen()), // Login screen route
          GetPage(name: '/signup', page: () => SignupScreen()),
          GetPage(name: '/admin', page: () => const AdminDashboardScreen()),
          GetPage(name: '/staff', page: () => StaffDashboardScreen()),
          GetPage(name: '/viewAllUsers', page: () => const UserListScreen()),
          GetPage(name: '/menu_update', page: () => UploadImageScreen()),
          GetPage(name: '/trackOrder', page: () => CurrentOrdersScreen()),
          // Add GetPage entries for other new screens as well


          // Signup screen route
        ],
      );
    });
  }
}

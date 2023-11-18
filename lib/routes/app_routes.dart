import 'package:canteenpreorderapp/presentation/students_and_faculty_sf_one_screen/students_and_faculty_sf_one_screen.dart';
import 'package:canteenpreorderapp/presentation/students_and_faculty_sf_one_screen/binding/students_and_faculty_sf_one_binding.dart';
import 'package:canteenpreorderapp/presentation/sf_dashbord_one_container1_screen/sf_dashbord_one_container1_screen.dart';
import 'package:canteenpreorderapp/presentation/sf_dashbord_one_container1_screen/binding/sf_dashbord_one_container1_binding.dart';
import 'package:canteenpreorderapp/presentation/sf_dashbord_screen/sf_dashbord_screen.dart';
import 'package:canteenpreorderapp/presentation/sf_dashbord_screen/binding/sf_dashbord_binding.dart';
import 'package:canteenpreorderapp/presentation/sf_item_view_one_screen/sf_item_view_one_screen.dart';
import 'package:canteenpreorderapp/presentation/sf_item_view_one_screen/binding/sf_item_view_one_binding.dart';
import 'package:canteenpreorderapp/presentation/sf_cart_view_screen/sf_cart_view_screen.dart';
import 'package:canteenpreorderapp/presentation/sf_cart_view_screen/binding/sf_cart_view_binding.dart';
import 'package:canteenpreorderapp/presentation/sf_profile_screen/sf_profile_screen.dart';
import 'package:canteenpreorderapp/presentation/sf_profile_screen/binding/sf_profile_binding.dart';
import 'package:canteenpreorderapp/presentation/sf_orders_screen/sf_orders_screen.dart';
import 'package:canteenpreorderapp/presentation/sf_orders_screen/binding/sf_orders_binding.dart';
import 'package:canteenpreorderapp/presentation/sf_item_view_screen/sf_item_view_screen.dart';
import 'package:canteenpreorderapp/presentation/sf_item_view_screen/binding/sf_item_view_binding.dart';
import 'package:canteenpreorderapp/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:canteenpreorderapp/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String studentsAndFacultySfOneScreen =
      '/students_and_faculty_sf_one_screen';

  static const String sfDashbordOneContainerPage =
      '/sf_dashbord_one_container_page';

  static const String sfDashbordOneContainer1Screen =
      '/sf_dashbord_one_container1_screen';

  static const String sfDashbordScreen = '/sf_dashbord_screen';

  static const String sfItemViewOneScreen = '/sf_item_view_one_screen';

  static const String sfCartViewScreen = '/sf_cart_view_screen';

  static const String sfProfileScreen = '/sf_profile_screen';

  static const String sfOrdersScreen = '/sf_orders_screen';

  static const String sfItemViewScreen = '/sf_item_view_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: studentsAndFacultySfOneScreen,
      page: () => StudentsAndFacultySfOneScreen(),
      bindings: [
        StudentsAndFacultySfOneBinding(),
      ],
    ),
    GetPage(
      name: sfDashbordOneContainer1Screen,
      page: () => SfDashbordOneContainer1Screen(),
      bindings: [
        SfDashbordOneContainer1Binding(),
      ],
    ),
    GetPage(
      name: sfDashbordScreen,
      page: () => SfDashbordScreen(),
      bindings: [
        SfDashbordBinding(),
      ],
    ),
    GetPage(
      name: sfItemViewOneScreen,
      page: () => SfItemViewOneScreen(),
      bindings: [
        SfItemViewOneBinding(),
      ],
    ),
    GetPage(
      name: sfCartViewScreen,
      page: () => SfCartViewScreen(),
      bindings: [
        SfCartViewBinding(),
      ],
    ),
    GetPage(
      name: sfProfileScreen,
      page: () => SfProfileScreen(),
      bindings: [
        SfProfileBinding(),
      ],
    ),
    GetPage(
      name: sfOrdersScreen,
      page: () => SfOrdersScreen(),
      bindings: [
        SfOrdersBinding(),
      ],
    ),
    GetPage(
      name: sfItemViewScreen,
      page: () => SfItemViewScreen(),
      bindings: [
        SfItemViewBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => StudentsAndFacultySfOneScreen(),
      bindings: [
        StudentsAndFacultySfOneBinding(),
      ],
    )
  ];
}

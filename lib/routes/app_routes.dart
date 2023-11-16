import 'package:canteenpreorder/presentation/students_and_faculty_sf_one_screen/students_and_faculty_sf_one_screen.dart';
import 'package:canteenpreorder/presentation/students_and_faculty_sf_one_screen/binding/students_and_faculty_sf_one_binding.dart';
import 'package:canteenpreorder/presentation/sf_cart_view_screen/sf_cart_view_screen.dart';
import 'package:canteenpreorder/presentation/sf_cart_view_screen/binding/sf_cart_view_binding.dart';
import 'package:canteenpreorder/presentation/sf_delivery_option_screen/sf_delivery_option_screen.dart';
import 'package:canteenpreorder/presentation/sf_delivery_option_screen/binding/sf_delivery_option_binding.dart';
import 'package:canteenpreorder/presentation/sf_orders_container_screen/sf_orders_container_screen.dart';
import 'package:canteenpreorder/presentation/sf_orders_container_screen/binding/sf_orders_container_binding.dart';
import 'package:canteenpreorder/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:canteenpreorder/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String studentsAndFacultySfOneScreen =
      '/students_and_faculty_sf_one_screen';

  static const String sfCartViewScreen = '/sf_cart_view_screen';

  static const String sfDeliveryOptionScreen = '/sf_delivery_option_screen';

  static const String sfProfilePage = '/sf_profile_page';

  static const String sfOrdersPage = '/sf_orders_page';

  static const String sfOrdersContainerScreen = '/sf_orders_container_screen';

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
      name: sfCartViewScreen,
      page: () => SfCartViewScreen(),
      bindings: [
        SfCartViewBinding(),
      ],
    ),
    GetPage(
      name: sfDeliveryOptionScreen,
      page: () => SfDeliveryOptionScreen(),
      bindings: [
        SfDeliveryOptionBinding(),
      ],
    ),
    GetPage(
      name: sfOrdersContainerScreen,
      page: () => SfOrdersContainerScreen(),
      bindings: [
        SfOrdersContainerBinding(),
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

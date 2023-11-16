import 'controller/sf_orders_container_controller.dart';
import 'package:canteenpreorder/core/app_export.dart';
import 'package:canteenpreorder/presentation/sf_orders_page/sf_orders_page.dart';
import 'package:canteenpreorder/presentation/sf_profile_page/sf_profile_page.dart';
import 'package:canteenpreorder/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class SfOrdersContainerScreen extends GetWidget<SfOrdersContainerController> {
  const SfOrdersContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: AppRoutes.sfOrdersPage,
                onGenerateRoute: (routeSetting) => GetPageRoute(
                    page: () => getCurrentPage(routeSetting.name!),
                    transition: Transition.noTransition)),
            bottomNavigationBar: Padding(
                padding: EdgeInsets.symmetric(horizontal: 47.h),
                child: _buildBottomBar())));
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {});
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.sfOrdersPage:
        return SfOrdersPage();
      case AppRoutes.sfProfilePage:
        return SfProfilePage();
      default:
        return SfOrdersPage();
    }
  }
}

import 'controller/sf_dashbord_one_container1_controller.dart';
import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/presentation/sf_dashbord_one_container_page/sf_dashbord_one_container_page.dart';
import 'package:canteenpreorderapp/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class SfDashbordOneContainer1Screen
    extends GetWidget<SfDashbordOneContainer1Controller> {
  const SfDashbordOneContainer1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                padding: EdgeInsets.only(bottom: 64.v),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0.5, 0),
                        end: Alignment(0.5, 1),
                        colors: [
                      appTheme.gray500.withOpacity(0.7),
                      theme.colorScheme.onPrimary
                    ])),
                child: Navigator(
                    key: Get.nestedKey(1),
                    initialRoute: AppRoutes.sfDashbordOneContainerPage,
                    onGenerateRoute: (routeSetting) => GetPageRoute(
                        page: () => getCurrentPage(routeSetting.name!),
                        transition: Transition.noTransition))),
            bottomNavigationBar: Padding(
                padding: EdgeInsets.only(left: 3.h),
                child: _buildBottomBar())));
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type), id: 1);
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.sfDashbordOneContainerPage;
      case BottomBarEnum.Searchwhitea70001:
        return "/";
      case BottomBarEnum.Cart:
        return "/";
      case BottomBarEnum.User:
        return AppRoutes.sfProfileScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.sfDashbordOneContainerPage:
        return SfDashbordOneContainerPage();
      default:
        return DefaultWidget();
    }
  }
}

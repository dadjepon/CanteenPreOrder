import 'controller/app_navigation_controller.dart';
import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          screenTitle: "Students and Faculty(SF) - One".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.studentsAndFacultySfOneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "SF - Dashbord One - Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.sfDashbordOneContainer1Screen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "SF - Dashbord".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.sfDashbordScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "SF - Item view One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.sfItemViewOneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "SF - Cart view".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.sfCartViewScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "SF - Profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.sfProfileScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "SF - Orders".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.sfOrdersScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "SF - Item view".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.sfItemViewScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}

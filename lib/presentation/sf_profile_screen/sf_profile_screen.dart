import 'controller/sf_profile_controller.dart';
import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/presentation/sf_dashbord_one_container_page/sf_dashbord_one_container_page.dart';
import 'package:canteenpreorderapp/widgets/custom_bottom_bar.dart';
import 'package:canteenpreorderapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SfProfileScreen extends GetWidget<SfProfileController> {
  const SfProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray50001,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 60.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(left: 41.h, right: 26.h),
                              child: Column(children: [
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgArrowLeftBlack900,
                                    height: 24.adaptSize,
                                    width: 24.adaptSize,
                                    alignment: Alignment.centerLeft,
                                    onTap: () {
                                      onTapImgArrowLeft();
                                    }),
                                SizedBox(height: 1.v),
                                Text("lbl_my_profile".tr,
                                    style: CustomTextStyles.headlineSmallBlack),
                                SizedBox(height: 37.v),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 15.h),
                                        child: Text("msg_personal_details".tr,
                                            style: CustomTextStyles
                                                .titleMedium18))),
                                SizedBox(height: 15.v),
                                _buildKofiJoe(),
                                SizedBox(height: 23.v),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 5.h, right: 3.h),
                                    child: _buildFiftyEight(
                                        paymentDetails: "lbl_orders".tr)),
                                SizedBox(height: 24.v),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 5.h, right: 3.h),
                                    child: _buildFiftyEight(
                                        paymentDetails:
                                            "lbl_payment_details".tr)),
                                SizedBox(height: 29.v),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 5.h, right: 3.h),
                                    child: _buildFiftyEight(
                                        paymentDetails:
                                            "lbl_favourite_meals".tr)),
                                SizedBox(height: 29.v),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 5.h, right: 3.h),
                                    child: _buildFiftyEight(
                                        paymentDetails: "lbl_help".tr)),
                                SizedBox(height: 101.v),
                                CustomElevatedButton(
                                    height: 70.v,
                                    text: "lbl_update".tr,
                                    margin: EdgeInsets.only(left: 9.h),
                                    buttonStyle:
                                        CustomButtonStyles.fillPrimaryContainer,
                                    buttonTextStyle:
                                        CustomTextStyles.titleMediumGray100)
                              ]))))
                ])),
            bottomNavigationBar: Padding(
                padding: EdgeInsets.only(right: 3.h),
                child: _buildBottomBar())));
  }

  /// Section Widget
  Widget _buildKofiJoe() {
    return Container(
        margin: EdgeInsets.only(left: 5.h, right: 3.h),
        padding: EdgeInsets.symmetric(vertical: 5.v),
        decoration: AppDecoration.outlineBlack9005
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgRectangle6,
                  height: 100.v,
                  width: 90.h,
                  radius: BorderRadius.circular(10.h),
                  margin: EdgeInsets.only(top: 20.v, bottom: 65.v)),
              Padding(
                  padding: EdgeInsets.only(top: 19.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("lbl_kofi_joe".tr,
                            style: CustomTextStyles.titleMedium18),
                        SizedBox(height: 2.v),
                        Opacity(
                            opacity: 0.5,
                            child: Text("msg_kofijoe_gmail_com".tr,
                                style: CustomTextStyles.bodyMediumBlack900)),
                        Opacity(
                            opacity: 0.5,
                            child: SizedBox(width: 164.h, child: Divider())),
                        SizedBox(height: 6.v),
                        Opacity(
                            opacity: 0.5,
                            child: Text("lbl_233_9011039271".tr,
                                style: CustomTextStyles.bodyMediumBlack900)),
                        SizedBox(height: 1.v),
                        Opacity(
                            opacity: 0.5,
                            child: SizedBox(width: 164.h, child: Divider())),
                        SizedBox(height: 7.v),
                        SizedBox(
                            height: 73.v,
                            width: 184.h,
                            child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Opacity(
                                          opacity: 0.5,
                                          child: SizedBox(
                                              width: 166.h,
                                              child: Text(
                                                  "msg_no_15_uti_street".tr,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: CustomTextStyles
                                                      .bodyMediumBlack900)))),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text("lbl_edit".tr,
                                          style: CustomTextStyles
                                              .bodyMediumPrimary))
                                ]))
                      ]))
            ]));
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type), id: 1);
    });
  }

  /// Common widget
  Widget _buildFiftyEight({required String paymentDetails}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 11.v),
        decoration: AppDecoration.outlineBlack9005
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 9.v),
                  child: Text(paymentDetails,
                      style: CustomTextStyles.titleMedium18
                          .copyWith(color: appTheme.black900))),
              CustomImageView(
                  imagePath: ImageConstant.imgArrowRight,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(top: 7.v, right: 23.h, bottom: 5.v))
            ]));
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
        return "/";
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

  /// Navigates to the previous screen.
  onTapImgArrowLeft() {
    Get.back();
  }
}

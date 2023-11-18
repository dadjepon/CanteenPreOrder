import 'controller/sf_item_view_one_controller.dart';
import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/presentation/sf_dashbord_one_container_page/sf_dashbord_one_container_page.dart';
import 'package:canteenpreorderapp/widgets/custom_bottom_bar.dart';
import 'package:canteenpreorderapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SfItemViewOneScreen extends GetWidget<SfItemViewOneController> {
  const SfItemViewOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70001,
            body: SizedBox(
                height: 780.v,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgRectangle9,
                      height: 442.v,
                      width: 389.h,
                      alignment: Alignment.topCenter),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          margin: EdgeInsets.only(left: 2.h),
                          padding: EdgeInsets.all(27.h),
                          decoration: AppDecoration.outlineBlack9003.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL50),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 13.h, right: 11.h),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 3.v),
                                                  child: Text(
                                                      "lbl_beef_burger".tr,
                                                      style: theme.textTheme
                                                          .headlineSmall)),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 3.v),
                                                  child: Text("lbl_ghc20".tr,
                                                      style: CustomTextStyles
                                                          .headlineSmallPrimary))
                                            ]))),
                                SizedBox(height: 6.v),
                                Container(
                                    width: 259.h,
                                    margin: EdgeInsets.only(
                                        left: 10.h, right: 64.h),
                                    child: Text("msg_description_of_the".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles
                                            .bodyMediumGray500)),
                                SizedBox(height: 67.v),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 7.h, right: 18.h),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 4.v),
                                              child: Text("lbl_add_ons".tr,
                                                  style: CustomTextStyles
                                                      .titleSmallBlack900)),
                                          Text("lbl_ghc9".tr,
                                              style: CustomTextStyles
                                                  .titleLargePrimary)
                                        ])),
                                SizedBox(height: 31.v),
                                Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 46.h, right: 41.h),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                  height: 76.v,
                                                  width: 79.h,
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Container(
                                                                height: 76.v,
                                                                width: 70.h,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            5.h,
                                                                        vertical: 20
                                                                            .v),
                                                                decoration: AppDecoration
                                                                    .fillGray
                                                                    .copyWith(
                                                                        borderRadius: BorderRadiusStyle
                                                                            .roundedBorder15),
                                                                child: CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgCheese31,
                                                                    height:
                                                                        34.v,
                                                                    width: 60.h,
                                                                    alignment:
                                                                        Alignment
                                                                            .center))),
                                                        CustomImageView(
                                                            imagePath:
                                                                ImageConstant
                                                                    .imgInfo,
                                                            height:
                                                                18.adaptSize,
                                                            width: 18.adaptSize,
                                                            alignment: Alignment
                                                                .bottomRight)
                                                      ])),
                                              Container(
                                                  height: 76.v,
                                                  width: 79.h,
                                                  margin: EdgeInsets.only(
                                                      left: 5.h),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Container(
                                                                height: 76.v,
                                                                width: 70.h,
                                                                decoration: BoxDecoration(
                                                                    color: appTheme
                                                                        .gray20001,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.h)))),
                                                        CustomImageView(
                                                            imagePath:
                                                                ImageConstant
                                                                    .imgInfo,
                                                            height:
                                                                18.adaptSize,
                                                            width: 18.adaptSize,
                                                            alignment: Alignment
                                                                .bottomRight),
                                                        CustomImageView(
                                                            imagePath: ImageConstant
                                                                .imgImagesRemovebgPreview,
                                                            height:
                                                                60.adaptSize,
                                                            width: 60.adaptSize,
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 3.h))
                                                      ])),
                                              Container(
                                                  height: 76.v,
                                                  width: 79.h,
                                                  margin: EdgeInsets.only(
                                                      left: 5.h),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Container(
                                                                height: 76.v,
                                                                width: 70.h,
                                                                decoration: BoxDecoration(
                                                                    color: appTheme
                                                                        .gray20001,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.h)))),
                                                        CustomImageView(
                                                            imagePath:
                                                                ImageConstant
                                                                    .imgInfo,
                                                            height:
                                                                18.adaptSize,
                                                            width: 18.adaptSize,
                                                            alignment: Alignment
                                                                .bottomRight),
                                                        CustomImageView(
                                                            imagePath: ImageConstant
                                                                .imgSchezwanSauce,
                                                            height: 45.v,
                                                            width: 60.h,
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 5.h))
                                                      ]))
                                            ]))),
                                SizedBox(height: 42.v),
                                CustomElevatedButton(
                                    text: "lbl_add_to_cart".tr,
                                    buttonStyle: CustomButtonStyles.none,
                                    decoration: CustomButtonStyles
                                        .gradientPrimaryToErrorContainerDecoration),
                                SizedBox(height: 56.v)
                              ]))),
                  _buildArrowLeft()
                ])),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  Widget _buildArrowLeft() {
    return Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
            height: 351.v,
            width: double.maxFinite,
            child: Stack(alignment: Alignment.bottomLeft, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgEllipse1,
                  height: 351.v,
                  width: 390.h,
                  alignment: Alignment.center),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12.h, bottom: 12.v),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 19.h),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgArrowLeft,
                                              height: 24.v,
                                              width: 15.h,
                                              margin: EdgeInsets.only(
                                                  bottom: 222.v),
                                              onTap: () {
                                                onTapImgArrowLeft();
                                              }),
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgFastFoodBurger5,
                                              height: 235.v,
                                              width: 255.h,
                                              margin: EdgeInsets.only(
                                                  left: 24.h, top: 12.v))
                                        ]))),
                            SizedBox(height: 30.v),
                            SizedBox(
                                height: 23.v,
                                width: 74.h,
                                child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              height: 23.v,
                                              width: 74.h,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 13.h,
                                                  vertical: 4.v),
                                              decoration: AppDecoration
                                                  .fillBlack
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder10),
                                              child: CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgSettings,
                                                  height: 14.v,
                                                  width: 21.h,
                                                  alignment:
                                                      Alignment.topLeft))),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 9.h),
                                              child: Text("lbl_4_8".tr,
                                                  style: CustomTextStyles
                                                      .titleSmallYellowA400)))
                                    ]))
                          ])))
            ])));
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

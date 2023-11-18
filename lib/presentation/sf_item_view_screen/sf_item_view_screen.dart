import 'controller/sf_item_view_controller.dart';
import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/presentation/sf_dashbord_one_container_page/sf_dashbord_one_container_page.dart';
import 'package:canteenpreorderapp/widgets/custom_bottom_bar.dart';
import 'package:canteenpreorderapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SfItemViewScreen extends GetWidget<SfItemViewController> {
  const SfItemViewScreen({Key? key}) : super(key: key);

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
                      imagePath: ImageConstant.imgRectangle9442x389,
                      height: 442.v,
                      width: 389.h,
                      alignment: Alignment.topCenter),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          margin: EdgeInsets.only(left: 2.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 27.h, vertical: 30.v),
                          decoration: AppDecoration.outlineBlack9003.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL50),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            _buildWaakye(),
                            SizedBox(height: 5.v),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    width: 259.h,
                                    margin: EdgeInsets.only(
                                        left: 10.h, right: 64.h),
                                    child: Text("msg_description_of_the".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles
                                            .bodyMediumGray500))),
                            SizedBox(height: 43.v),
                            _buildDescription(),
                            SizedBox(height: 41.v),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.h),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("lbl_delivery_option".tr,
                                          style: CustomTextStyles
                                              .titleSmallBlack900),
                                      Text("lbl_pick_up".tr,
                                          style: CustomTextStyles
                                              .bodyMediumRegular)
                                    ])),
                            SizedBox(height: 45.v),
                            CustomElevatedButton(
                                text: "lbl_cancel_order".tr,
                                buttonStyle: CustomButtonStyles.none,
                                decoration: CustomButtonStyles
                                    .gradientPrimaryToErrorContainerDecoration),
                            SizedBox(height: 53.v)
                          ]))),
                  _buildArrowLeft()
                ])),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  Widget _buildWaakye() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 3.v),
              child:
                  Text("lbl_waakye".tr, style: theme.textTheme.headlineSmall)),
          Padding(
              padding: EdgeInsets.only(bottom: 3.v),
              child: Text("lbl_ghc30".tr,
                  style: CustomTextStyles.headlineSmallPrimary))
        ]));
  }

  /// Section Widget
  Widget _buildDescription() {
    return Container(
        margin: EdgeInsets.only(left: 7.h, right: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 23.v),
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder15),
        child: Column(children: [
          SizedBox(height: 6.v),
          SizedBox(
              width: 271.h,
              child: Text("msg_some_information2".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium))
        ]));
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
                  imagePath: ImageConstant.imgEllipse1351x390,
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
                            CustomImageView(
                                imagePath: ImageConstant.imgArrowLeft,
                                height: 24.v,
                                width: 15.h,
                                margin: EdgeInsets.only(left: 20.h),
                                onTap: () {
                                  onTapImgArrowLeft();
                                }),
                            SizedBox(height: 14.v),
                            CustomImageView(
                                imagePath:
                                    ImageConstant.imgFastFoodBurger5200x209,
                                height: 200.v,
                                width: 209.h,
                                alignment: Alignment.centerRight),
                            SizedBox(height: 44.v),
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

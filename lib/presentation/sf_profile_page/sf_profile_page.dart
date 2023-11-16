import 'controller/sf_profile_controller.dart';
import 'models/sf_profile_model.dart';
import 'package:canteenpreorder/core/app_export.dart';
import 'package:canteenpreorder/widgets/app_bar/appbar_leading_image.dart';
import 'package:canteenpreorder/widgets/app_bar/appbar_subtitle.dart';
import 'package:canteenpreorder/widgets/app_bar/appbar_title.dart';
import 'package:canteenpreorder/widgets/app_bar/custom_app_bar.dart';
import 'package:canteenpreorder/widgets/custom_elevated_button.dart';
import 'package:canteenpreorder/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SfProfilePage extends StatelessWidget {
  SfProfilePage({Key? key}) : super(key: key);

  SfProfileController controller =
      Get.put(SfProfileController(SfProfileModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 37.v),
                    child: Padding(
                        padding: EdgeInsets.only(left: 50.h, right: 38.h),
                        child: Column(children: [
                          Padding(
                              padding: EdgeInsets.only(left: 6.h),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 1.v),
                                        child: Text("msg_personal_details".tr,
                                            style: CustomTextStyles
                                                .titleMedium18)),
                                    Padding(
                                        padding: EdgeInsets.only(top: 5.v),
                                        child: Text("lbl_change".tr,
                                            style: CustomTextStyles
                                                .bodyMediumPrimary))
                                  ])),
                          SizedBox(height: 4.v),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 6.h),
                              padding: EdgeInsets.symmetric(vertical: 9.v),
                              decoration: AppDecoration.outlineBlack900
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder20),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgRectangle6,
                                        height: 100.v,
                                        width: 91.h,
                                        radius: BorderRadius.circular(10.h),
                                        margin: EdgeInsets.only(
                                            top: 8.v, bottom: 69.v)),
                                    Padding(
                                        padding: EdgeInsets.only(top: 17.v),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("lbl_marvis_ighedosa".tr,
                                                  style: CustomTextStyles
                                                      .titleMedium18),
                                              Opacity(
                                                  opacity: 0.5,
                                                  child: Text(
                                                      "msg_dosamarvis_gmail_com"
                                                          .tr,
                                                      style: CustomTextStyles
                                                          .bodyMediumBlack900)),
                                              Opacity(
                                                  opacity: 0.5,
                                                  child: SizedBox(
                                                      width: 165.h,
                                                      child: Divider(
                                                          color: appTheme
                                                              .black900
                                                              .withOpacity(
                                                                  0.53)))),
                                              SizedBox(height: 6.v),
                                              Opacity(
                                                  opacity: 0.5,
                                                  child: Text(
                                                      "lbl_233_9011039271".tr,
                                                      style: CustomTextStyles
                                                          .bodyMediumBlack900)),
                                              SizedBox(height: 1.v),
                                              Opacity(
                                                  opacity: 0.5,
                                                  child: SizedBox(
                                                      width: 165.h,
                                                      child: Divider(
                                                          color: appTheme
                                                              .black900
                                                              .withOpacity(
                                                                  0.53)))),
                                              SizedBox(height: 7.v),
                                              Opacity(
                                                  opacity: 0.5,
                                                  child: SizedBox(
                                                      width: 166.h,
                                                      child: Text(
                                                          "msg_no_15_uti_street"
                                                              .tr,
                                                          maxLines: 3,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: CustomTextStyles
                                                              .bodyMediumBlack900)))
                                            ]))
                                  ])),
                          SizedBox(height: 33.v),
                          _buildChevronLeft1(),
                          SizedBox(height: 27.v),
                          _buildChevronLeft2(),
                          SizedBox(height: 27.v),
                          _buildChevronLeft3(),
                          SizedBox(height: 27.v),
                          _buildChevronLeft4(),
                          SizedBox(height: 102.v),
                          _buildUpdate()
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 97.v,
        leadingWidth: 65.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 41.h, top: 20.v, bottom: 37.v),
            onTap: () {
              onTapArrowLeft();
            }),
        centerTitle: true,
        title: AppbarSubtitle(
            text: "lbl_my_profile".tr, margin: EdgeInsets.only(top: 46.v)),
        actions: [
          AppbarTitle(
              text: "lbl_logo".tr,
              margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 27.v))
        ]);
  }

  /// Section Widget
  Widget _buildChevronLeft1() {
    return Padding(
        padding: EdgeInsets.only(left: 6.h, right: 7.h),
        child: CustomTextFormField(
            controller: controller.chevronLeft1Controller,
            hintText: "lbl_orders".tr,
            suffix: Container(
                margin: EdgeInsets.fromLTRB(30.h, 19.v, 25.h, 17.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgChevronleft,
                    height: 24.adaptSize,
                    width: 24.adaptSize)),
            suffixConstraints: BoxConstraints(maxHeight: 60.v)));
  }

  /// Section Widget
  Widget _buildChevronLeft2() {
    return Padding(
        padding: EdgeInsets.only(left: 6.h, right: 7.h),
        child: CustomTextFormField(
            controller: controller.chevronLeft2Controller,
            hintText: "lbl_payment_details".tr,
            suffix: Container(
                margin: EdgeInsets.fromLTRB(30.h, 19.v, 25.h, 17.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgChevronleft,
                    height: 24.adaptSize,
                    width: 24.adaptSize)),
            suffixConstraints: BoxConstraints(maxHeight: 60.v)));
  }

  /// Section Widget
  Widget _buildChevronLeft3() {
    return Padding(
        padding: EdgeInsets.only(left: 6.h, right: 7.h),
        child: CustomTextFormField(
            controller: controller.chevronLeft3Controller,
            hintText: "lbl_favourite_meals".tr,
            suffix: Container(
                margin: EdgeInsets.fromLTRB(30.h, 19.v, 25.h, 17.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgChevronleft,
                    height: 24.adaptSize,
                    width: 24.adaptSize)),
            suffixConstraints: BoxConstraints(maxHeight: 60.v)));
  }

  /// Section Widget
  Widget _buildChevronLeft4() {
    return Padding(
        padding: EdgeInsets.only(left: 6.h, right: 7.h),
        child: CustomTextFormField(
            controller: controller.chevronLeft4Controller,
            hintText: "lbl_help".tr,
            textInputAction: TextInputAction.done,
            suffix: Container(
                margin: EdgeInsets.fromLTRB(30.h, 19.v, 25.h, 17.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgChevronleft,
                    height: 24.adaptSize,
                    width: 24.adaptSize)),
            suffixConstraints: BoxConstraints(maxHeight: 60.v)));
  }

  /// Section Widget
  Widget _buildUpdate() {
    return CustomElevatedButton(
        height: 70.v,
        text: "lbl_update".tr,
        margin: EdgeInsets.only(right: 14.h),
        buttonStyle: CustomButtonStyles.fillPrimaryContainer,
        buttonTextStyle: CustomTextStyles.titleMediumGray10001,
        alignment: Alignment.centerLeft);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}

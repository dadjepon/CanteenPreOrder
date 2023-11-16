import 'controller/sf_delivery_option_controller.dart';
import 'package:canteenpreorder/core/app_export.dart';
import 'package:canteenpreorder/widgets/app_bar/appbar_leading_image.dart';
import 'package:canteenpreorder/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:canteenpreorder/widgets/app_bar/appbar_title.dart';
import 'package:canteenpreorder/widgets/app_bar/custom_app_bar.dart';
import 'package:canteenpreorder/widgets/custom_radio_button.dart';
import 'package:canteenpreorder/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SfDeliveryOptionScreen extends GetWidget<SfDeliveryOptionController> {
  const SfDeliveryOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: Container(
                width: 404.h,
                padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 23.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 18.v),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 23.h),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("lbl_address_details".tr,
                                        style: theme.textTheme.titleMedium),
                                    Padding(
                                        padding: EdgeInsets.only(top: 2.v),
                                        child: Text("lbl_change".tr,
                                            style: CustomTextStyles
                                                .bodyMediumPrimary))
                                  ]))),
                      SizedBox(height: 14.v),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: 315.h,
                              margin: EdgeInsets.only(left: 19.h, right: 12.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.h, vertical: 19.v),
                              decoration: AppDecoration.outlineBlack900
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder20),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 4.v),
                                    Padding(
                                        padding: EdgeInsets.only(right: 23.h),
                                        child: CustomTextFormField(
                                            controller:
                                                controller.kofiCoffeeController,
                                            hintText: "lbl_kofi_coffee".tr,
                                            hintStyle: CustomTextStyles
                                                .titleMediumMedium,
                                            textInputAction:
                                                TextInputAction.done,
                                            borderDecoration:
                                                TextFormFieldStyleHelper
                                                    .underLineBlack,
                                            filled: false)),
                                    SizedBox(height: 8.v),
                                    SizedBox(
                                        width: 135.h,
                                        child: Text(
                                            "msg_hostel_2d_room_i9_ashesi".tr,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: CustomTextStyles
                                                .bodyMediumRegular)),
                                    Opacity(
                                        opacity: 0.3,
                                        child: Divider(endIndent: 23.h)),
                                    SizedBox(height: 7.v),
                                    Text("lbl_233_9011039271".tr,
                                        style:
                                            CustomTextStyles.bodyMediumRegular)
                                  ]))),
                      SizedBox(height: 36.v),
                      Padding(
                          padding: EdgeInsets.only(left: 19.h),
                          child: Text("msg_delivery_method".tr,
                              style: theme.textTheme.titleMedium)),
                      SizedBox(height: 12.v),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: 315.h,
                              margin: EdgeInsets.symmetric(horizontal: 16.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 21.h, vertical: 28.v),
                              decoration: AppDecoration.outlineBlack900
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder20),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 2.v),
                                    _buildDoorDelivery(),
                                    SizedBox(height: 17.v),
                                    Opacity(
                                        opacity: 0.3,
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Divider(
                                                indent: 28.h,
                                                endIndent: 13.h))),
                                    SizedBox(height: 25.v),
                                    _buildPickUp()
                                  ]))),
                      SizedBox(height: 29.v),
                      Padding(
                          padding: EdgeInsets.only(left: 13.h, right: 23.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 13.v, bottom: 3.v),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 3.h),
                                              child: Text("lbl_delivery_fee".tr,
                                                  style: theme
                                                      .textTheme.bodyLarge)),
                                          SizedBox(height: 1.v),
                                          Text("lbl_total".tr,
                                              style: theme.textTheme.bodyLarge)
                                        ])),
                                Column(children: [
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                          padding: EdgeInsets.only(right: 3.h),
                                          child: Text("lbl_10".tr,
                                              style: CustomTextStyles
                                                  .titleLargeBlack))),
                                  SizedBox(height: 4.v),
                                  Text("lbl_ghc_85".tr,
                                      style: CustomTextStyles.titleLargeBlack)
                                ])
                              ])),
                      SizedBox(height: 37.v),
                      _buildProceedToPayment(),
                      SizedBox(height: 31.v),
                      Padding(
                          padding: EdgeInsets.only(left: 19.h, right: 34.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgVectorWhiteA700,
                                    height: 17.v,
                                    width: 20.h,
                                    margin: EdgeInsets.only(
                                        top: 11.v, bottom: 5.v)),
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgVectorWhiteA70020x20,
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                    margin: EdgeInsets.only(top: 11.v)),
                                SizedBox(
                                    height: 33.v,
                                    width: 26.h,
                                    child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgVectorPrimary,
                                              height: 20.adaptSize,
                                              width: 20.adaptSize,
                                              alignment: Alignment.bottomLeft),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                  height: 14.adaptSize,
                                                  width: 14.adaptSize,
                                                  margin:
                                                      EdgeInsets.only(top: 1.v),
                                                  decoration: BoxDecoration(
                                                      color: theme
                                                          .colorScheme.primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7.h)))),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 4.h),
                                                  child: Text("lbl_22".tr,
                                                      style: theme.textTheme
                                                          .bodySmall)))
                                        ])),
                                CustomImageView(
                                    imagePath: ImageConstant.imgVector20x20,
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                    margin: EdgeInsets.only(top: 11.v))
                              ]))
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 100.v,
        leadingWidth: 50.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 26.h, top: 14.v, bottom: 40.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitleOne(
            text: "lbl_delivery".tr,
            margin: EdgeInsets.only(left: 120.h, top: 49.v)),
        actions: [
          AppbarTitle(
              text: "lbl_logo".tr,
              margin: EdgeInsets.only(left: 22.h, right: 22.h, bottom: 24.v))
        ]);
  }

  /// Section Widget
  Widget _buildDoorDelivery() {
    return Obx(() => CustomRadioButton(
        text: "lbl_door_delivery".tr,
        value: "lbl_door_delivery".tr,
        groupValue: controller.radioGroup.value,
        onChange: (value) {
          controller.radioGroup.value = value;
        }));
  }

  /// Section Widget
  Widget _buildPickUp() {
    return Obx(() => CustomRadioButton(
        text: "lbl_pick_up".tr,
        value: "lbl_pick_up".tr,
        groupValue: controller.radioGroup1.value,
        onChange: (value) {
          controller.radioGroup1.value = value;
        }));
  }

  /// Section Widget
  Widget _buildProceedToPayment() {
    return SizedBox(
        height: 41.v,
        width: 333.h,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  height: 41.v,
                  width: 333.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.h),
                      gradient: LinearGradient(
                          begin: Alignment(0.5, 0),
                          end: Alignment(0.5, 1),
                          colors: [
                            theme.colorScheme.primary,
                            theme.colorScheme.errorContainer
                          ])))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Text("msg_proceed_to_payment".tr,
                  style: CustomTextStyles.titleLargeWhiteA700))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}

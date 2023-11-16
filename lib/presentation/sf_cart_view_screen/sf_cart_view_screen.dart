import '../sf_cart_view_screen/widgets/slidablelist_item_widget.dart';
import 'controller/sf_cart_view_controller.dart';
import 'models/slidablelist_item_model.dart';
import 'package:canteenpreorder/core/app_export.dart';
import 'package:canteenpreorder/widgets/app_bar/appbar_leading_image.dart';
import 'package:canteenpreorder/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:canteenpreorder/widgets/app_bar/appbar_title.dart';
import 'package:canteenpreorder/widgets/app_bar/custom_app_bar.dart';
import 'package:canteenpreorder/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SfCartViewScreen extends GetWidget<SfCartViewController> {
  const SfCartViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 7.v),
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgIwwaSwipe,
                        height: 20.adaptSize,
                        width: 20.adaptSize),
                    Padding(
                        padding: EdgeInsets.only(left: 5.h, top: 5.v),
                        child: Text("msg_swipe_on_an_item".tr,
                            style: CustomTextStyles.bodySmallBlack900))
                  ]),
                  SizedBox(height: 19.v),
                  _buildSlidableList(),
                  SizedBox(height: 60.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 18.h),
                          child: Text("msg_order_instructions".tr,
                              style: CustomTextStyles.titleSmallBlack900))),
                  Container(
                      width: 310.h,
                      margin: EdgeInsets.symmetric(horizontal: 16.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.h, vertical: 10.v),
                      decoration: AppDecoration.fillWhiteA.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder9),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 2.v),
                            Container(
                                width: 237.h,
                                margin: EdgeInsets.only(right: 48.h),
                                child: Text("msg_add_specific_instructions".tr,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles
                                        .bodyMediumMochiyPopOne))
                          ])),
                  SizedBox(height: 116.v),
                  CustomElevatedButton(
                      height: 41.v,
                      text: "lbl_continue".tr,
                      margin: EdgeInsets.only(right: 9.h),
                      buttonStyle: CustomButtonStyles.none,
                      decoration: CustomButtonStyles
                          .gradientPrimaryToErrorContainerDecoration,
                      buttonTextStyle: CustomTextStyles.titleLargeWhiteA700),
                  SizedBox(height: 22.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgVectorWhiteA700,
                                height: 17.v,
                                width: 20.h,
                                margin:
                                    EdgeInsets.only(top: 11.v, bottom: 5.v)),
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
                                          imagePath:
                                              ImageConstant.imgVectorPrimary,
                                          height: 20.adaptSize,
                                          width: 20.adaptSize,
                                          alignment: Alignment.bottomLeft),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                              height: 14.adaptSize,
                                              width: 14.adaptSize,
                                              margin: EdgeInsets.only(top: 1.v),
                                              decoration: BoxDecoration(
                                                  color:
                                                      theme.colorScheme.primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.h)))),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 4.h),
                                              child: Text("lbl_22".tr,
                                                  style: theme
                                                      .textTheme.bodySmall)))
                                    ])),
                            CustomImageView(
                                imagePath: ImageConstant.imgVector20x20,
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                                margin: EdgeInsets.only(top: 11.v))
                          ])),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 44.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 20.h, top: 14.v, bottom: 41.v),
            onTap: () {
              onTapArrowLeft();
            }),
        centerTitle: true,
        title: AppbarSubtitleOne(
            text: "lbl_my_cart".tr, margin: EdgeInsets.only(top: 50.v)),
        actions: [
          AppbarTitle(
              text: "lbl_logo".tr,
              margin: EdgeInsets.only(left: 23.h, right: 23.h, bottom: 25.v))
        ]);
  }

  /// Section Widget
  Widget _buildSlidableList() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.h),
        child: Obx(() => ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 19.v);
            },
            itemCount: controller
                .sfCartViewModelObj.value.slidablelistItemList.value.length,
            itemBuilder: (context, index) {
              SlidablelistItemModel model = controller
                  .sfCartViewModelObj.value.slidablelistItemList.value[index];
              return SlidablelistItemWidget(model);
            })));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}

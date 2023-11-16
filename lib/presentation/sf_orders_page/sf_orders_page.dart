import '../sf_orders_page/widgets/sforders_item_widget.dart';
import 'controller/sf_orders_controller.dart';
import 'models/sf_orders_model.dart';
import 'models/sforders_item_model.dart';
import 'package:canteenpreorder/core/app_export.dart';
import 'package:canteenpreorder/widgets/app_bar/appbar_leading_image.dart';
import 'package:canteenpreorder/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:canteenpreorder/widgets/app_bar/appbar_title.dart';
import 'package:canteenpreorder/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SfOrdersPage extends StatelessWidget {
  SfOrdersPage({Key? key}) : super(key: key);

  SfOrdersController controller =
      Get.put(SfOrdersController(SfOrdersModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                height: 682.v,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 2.v),
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  _buildCancelColumn(),
                  _buildWaakyeRow(),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgIwwaSwipe,
                                height: 20.adaptSize,
                                width: 20.adaptSize),
                            Padding(
                                padding: EdgeInsets.only(left: 5.h, top: 3.v),
                                child: Text("msg_click_on_order_for".tr,
                                    style: CustomTextStyles.bodySmallBlack900))
                          ]))
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
            text: "lbl_my_orders".tr, margin: EdgeInsets.only(top: 50.v)),
        actions: [
          AppbarTitle(
              text: "lbl_logo".tr,
              margin: EdgeInsets.only(left: 23.h, right: 23.h, bottom: 25.v))
        ]);
  }

  /// Section Widget
  Widget _buildCancelColumn() {
    return Align(
        alignment: Alignment.topCenter,
        child: Padding(
            padding: EdgeInsets.only(left: 16.h, top: 17.v),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                  padding: EdgeInsets.only(right: 3.h),
                  child: Obx(() => ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 20.v);
                      },
                      itemCount: controller
                          .sfOrdersModelObj.value.sfordersItemList.value.length,
                      itemBuilder: (context, index) {
                        SfordersItemModel model = controller.sfOrdersModelObj
                            .value.sfordersItemList.value[index];
                        return SfordersItemWidget(model);
                      }))),
              SizedBox(height: 39.v),
              CustomImageView(
                  imagePath: ImageConstant.imgStarburstShape,
                  height: 79.v,
                  width: 85.h,
                  alignment: Alignment.centerRight)
            ])));
  }

  /// Section Widget
  Widget _buildWaakyeRow() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            margin: EdgeInsets.fromLTRB(17.h, 380.v, 17.h, 5.v),
            padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 8.v),
            decoration: AppDecoration.outlineBlack900
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgImage21,
                      height: 48.v,
                      width: 54.h,
                      radius: BorderRadius.circular(27.h),
                      margin: EdgeInsets.only(top: 8.v, bottom: 20.v)),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(left: 10.h, top: 1.v),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Text("lbl_waakye".tr,
                                      style: theme.textTheme.titleMedium),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 24.h, bottom: 3.v),
                                      child: Text("lbl_ghc_30".tr,
                                          style: theme.textTheme.titleSmall))
                                ]),
                                SizedBox(height: 4.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 3.h),
                                    child: Row(children: [
                                      SizedBox(
                                          width: 131.h,
                                          child: Text("msg_some_information".tr,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  theme.textTheme.bodyMedium)),
                                      Container(
                                          height: 23.v,
                                          width: 59.h,
                                          margin: EdgeInsets.only(
                                              left: 33.h,
                                              top: 16.v,
                                              bottom: 5.v),
                                          child: Stack(
                                              alignment: Alignment.topRight,
                                              children: [
                                                Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                        height: 23.v,
                                                        width: 59.h,
                                                        decoration: BoxDecoration(
                                                            color: theme
                                                                .colorScheme
                                                                .primary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(11
                                                                        .h)))),
                                                Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 4.h),
                                                        child: Text(
                                                            "lbl_cancel".tr,
                                                            style: theme
                                                                .textTheme
                                                                .labelLarge)))
                                              ]))
                                    ]))
                              ])))
                ])));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}

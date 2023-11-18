import '../sf_orders_screen/widgets/sforders_item_widget.dart';
import 'controller/sf_orders_controller.dart';
import 'models/sforders_item_model.dart';
import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/presentation/sf_dashbord_one_container_page/sf_dashbord_one_container_page.dart';
import 'package:canteenpreorderapp/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class SfOrdersScreen extends GetWidget<SfOrdersController> {
  const SfOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray50001,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 35.v),
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgArrowLeftBlack900,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      alignment: Alignment.centerLeft,
                      onTap: () {
                        onTapImgArrowLeft();
                      }),
                  SizedBox(height: 11.v),
                  Text("lbl_my_orders".tr,
                      style: CustomTextStyles.titleLargeBlack900),
                  SizedBox(height: 2.v),
                  SizedBox(
                      height: 474.v,
                      width: 330.h,
                      child: Stack(alignment: Alignment.topLeft, children: [
                        SizedBox(
                            width: double.maxFinite,
                            child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _buildSFOrders(),
                                      CustomImageView(
                                          imagePath:
                                              ImageConstant.imgStarburstShape,
                                          height: 79.v,
                                          width: 85.h,
                                          alignment: Alignment.centerRight)
                                    ]))),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 70.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgIwwaSwipe,
                                      height: 20.adaptSize,
                                      width: 20.adaptSize),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 5.h, top: 3.v),
                                      child: Text("msg_click_on_order_for".tr,
                                          style: CustomTextStyles
                                              .bodySmallPoppins))
                                ])))
                      ])),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  Widget _buildSFOrders() {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(right: 3.h),
            child: Obx(() => ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20.v);
                },
                itemCount: controller
                    .sfOrdersModelObj.value.sfordersItemList.value.length,
                itemBuilder: (context, index) {
                  SfordersItemModel model = controller
                      .sfOrdersModelObj.value.sfordersItemList.value[index];
                  return SfordersItemWidget(model);
                }))));
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

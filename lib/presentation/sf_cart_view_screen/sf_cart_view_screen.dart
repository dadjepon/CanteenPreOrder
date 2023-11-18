import '../sf_cart_view_screen/widgets/sfcartview_item_widget.dart';
import 'controller/sf_cart_view_controller.dart';
import 'models/sfcartview_item_model.dart';
import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/presentation/sf_dashbord_one_container_page/sf_dashbord_one_container_page.dart';
import 'package:canteenpreorderapp/widgets/custom_bottom_bar.dart';
import 'package:canteenpreorderapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SfCartViewScreen extends GetWidget<SfCartViewController> {
  const SfCartViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray50001,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(20.h),
                child: Column(children: [
                  SizedBox(height: 15.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgArrowLeftBlack900,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      alignment: Alignment.centerLeft,
                      onTap: () {
                        onTapImgArrowLeft();
                      }),
                  SizedBox(height: 11.v),
                  Text("lbl_my_cart".tr,
                      style: CustomTextStyles.titleLargeBlack900),
                  SizedBox(height: 7.v),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgIwwaSwipe,
                        height: 20.adaptSize,
                        width: 20.adaptSize),
                    Padding(
                        padding: EdgeInsets.only(left: 5.h, top: 5.v),
                        child: Text("msg_swipe_on_an_item".tr,
                            style: CustomTextStyles.bodySmallPoppins))
                  ]),
                  SizedBox(height: 20.v),
                  _buildSFCartView(),
                  Spacer(flex: 57),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: Text("msg_order_instructions".tr,
                              style: CustomTextStyles.titleSmallBlack900))),
                  Container(
                      width: 310.h,
                      margin: EdgeInsets.symmetric(horizontal: 20.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.h, vertical: 10.v),
                      decoration: AppDecoration.fillWhiteA.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10),
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
                  Spacer(flex: 42),
                  CustomElevatedButton(
                      text: "lbl_continue".tr,
                      margin: EdgeInsets.only(left: 4.h, right: 13.h),
                      buttonStyle: CustomButtonStyles.none,
                      decoration: CustomButtonStyles
                          .gradientPrimaryToErrorContainerDecoration)
                ])),
            bottomNavigationBar: Padding(
                padding: EdgeInsets.only(left: 3.h),
                child: _buildBottomBar())));
  }

  /// Section Widget
  Widget _buildSFCartView() {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 17.h),
        child: Obx(() => ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 14.v);
            },
            itemCount: controller
                .sfCartViewModelObj.value.sfcartviewItemList.value.length,
            itemBuilder: (context, index) {
              SfcartviewItemModel model = controller
                  .sfCartViewModelObj.value.sfcartviewItemList.value[index];
              return SfcartviewItemWidget(model);
            })));
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

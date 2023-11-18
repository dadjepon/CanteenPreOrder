import '../sf_dashbord_screen/widgets/all1_item_widget.dart';
import '../sf_dashbord_screen/widgets/beefburger1_item_widget.dart';
import '../sf_dashbord_screen/widgets/ghcthirtyfive1_item_widget.dart';
import '../sf_dashbord_screen/widgets/sfdashbord_item_widget.dart';
import 'controller/sf_dashbord_controller.dart';
import 'models/all1_item_model.dart';
import 'models/beefburger1_item_model.dart';
import 'models/ghcthirtyfive1_item_model.dart';
import 'models/sfdashbord_item_model.dart';
import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/presentation/sf_dashbord_one_container_page/sf_dashbord_one_container_page.dart';
import 'package:canteenpreorderapp/widgets/custom_bottom_bar.dart';
import 'package:canteenpreorderapp/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SfDashbordScreen extends GetWidget<SfDashbordController> {
  const SfDashbordScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          padding: EdgeInsets.only(bottom: 64.v),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [
                appTheme.gray500.withOpacity(0.7),
                theme.colorScheme.onPrimary,
              ],
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 13.h),
            child: Column(
              children: [
                SizedBox(
                  height: 148.v,
                  width: 295.h,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgScreenshot2023125x167,
                        height: 125.v,
                        width: 167.h,
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(right: 56.h),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomSearchView(
                          width: 295.h,
                          controller: controller.searchController,
                          hintText: "msg_search_your_desired".tr,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 26.v),
                _buildAll(),
                SizedBox(height: 31.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Text(
                      "lbl_most_popular".tr,
                      style: CustomTextStyles.titleMediumPrimary,
                    ),
                  ),
                ),
                SizedBox(height: 6.v),
                _buildBeefBurger(),
                SizedBox(height: 29.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 14.h),
                    child: Text(
                      "lbl_available_food".tr,
                      style: CustomTextStyles.bodyMediumMochiyPopOnePrimary,
                    ),
                  ),
                ),
                SizedBox(height: 9.v),
                _buildSFDashbord(),
                SizedBox(height: 8.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 14.h),
                    child: Text(
                      "msg_available_upon_request".tr,
                      style: CustomTextStyles.bodyMediumMochiyPopOnePrimary,
                    ),
                  ),
                ),
                SizedBox(height: 3.v),
                _buildGhcThirtyFive(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 3.h),
          child: _buildBottomBar(),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAll() {
    return SizedBox(
      height: 80.v,
      child: Obx(
        () => ListView.separated(
          padding: EdgeInsets.only(
            left: 14.h,
            right: 20.h,
          ),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 9.h,
            );
          },
          itemCount:
              controller.sfDashbordModelObj.value.all1ItemList.value.length,
          itemBuilder: (context, index) {
            All1ItemModel model =
                controller.sfDashbordModelObj.value.all1ItemList.value[index];
            return All1ItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBeefBurger() {
    return SizedBox(
      height: 152.v,
      child: Obx(
        () => ListView.separated(
          padding: EdgeInsets.only(
            left: 29.h,
            right: 12.h,
          ),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 17.h,
            );
          },
          itemCount: controller
              .sfDashbordModelObj.value.beefburger1ItemList.value.length,
          itemBuilder: (context, index) {
            Beefburger1ItemModel model = controller
                .sfDashbordModelObj.value.beefburger1ItemList.value[index];
            return Beefburger1ItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSFDashbord() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(left: 34.h),
        child: Obx(
          () => GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 57.v,
              crossAxisCount: 6,
              mainAxisSpacing: 6.h,
              crossAxisSpacing: 6.h,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller
                .sfDashbordModelObj.value.sfdashbordItemList.value.length,
            itemBuilder: (context, index) {
              SfdashbordItemModel model = controller
                  .sfDashbordModelObj.value.sfdashbordItemList.value[index];
              return SfdashbordItemWidget(
                model,
              );
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGhcThirtyFive() {
    return SizedBox(
      height: 55.v,
      child: Obx(
        () => ListView.separated(
          padding: EdgeInsets.only(
            left: 34.h,
            right: 17.h,
          ),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 6.h,
            );
          },
          itemCount: controller
              .sfDashbordModelObj.value.ghcthirtyfive1ItemList.value.length,
          itemBuilder: (context, index) {
            Ghcthirtyfive1ItemModel model = controller
                .sfDashbordModelObj.value.ghcthirtyfive1ItemList.value[index];
            return Ghcthirtyfive1ItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Get.toNamed(getCurrentRoute(type), id: 1);
      },
    );
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
}

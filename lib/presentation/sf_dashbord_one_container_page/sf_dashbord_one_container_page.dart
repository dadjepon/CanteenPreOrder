import '../sf_dashbord_one_container_page/widgets/all_item_widget.dart';
import '../sf_dashbord_one_container_page/widgets/beefburger_item_widget.dart';
import '../sf_dashbord_one_container_page/widgets/ghcthirtyfive_item_widget.dart';
import 'controller/sf_dashbord_one_container_controller.dart';
import 'models/all_item_model.dart';
import 'models/beefburger_item_model.dart';
import 'models/ghcthirtyfive_item_model.dart';
import 'models/sf_dashbord_one_container_model.dart';
import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

class SfDashbordOneContainerPage extends StatelessWidget {
  SfDashbordOneContainerPage({Key? key})
      : super(
          key: key,
        );

  SfDashbordOneContainerController controller = Get.put(
      SfDashbordOneContainerController(SfDashbordOneContainerModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
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
            decoration: AppDecoration.gradientGrayToOnPrimary,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 148.v,
                    width: 295.h,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgScreenshot2023,
                          height: 130.v,
                          width: 167.h,
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(right: 48.h),
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
                  SizedBox(height: 22.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "lbl_promotions".tr,
                      style: CustomTextStyles.titleSmallSemiBold,
                    ),
                  ),
                  _buildTodaySOffer(),
                  SizedBox(height: 20.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Text(
                        "lbl_favourites".tr,
                        style: CustomTextStyles.titleMediumPrimary,
                      ),
                    ),
                  ),
                  SizedBox(height: 9.v),
                  _buildBeefBurger(),
                  SizedBox(height: 16.v),
                  Text(
                    "lbl_available_food".tr,
                    style: CustomTextStyles.bodyMediumMochiyPopOnePrimary,
                  ),
                  SizedBox(height: 9.v),
                  _buildGhcThirtyFive(),
                ],
              ),
            ),
          ),
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
            left: 8.h,
            right: 14.h,
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
          itemCount: controller
              .sfDashbordOneContainerModelObj.value.allItemList.value.length,
          itemBuilder: (context, index) {
            AllItemModel model = controller
                .sfDashbordOneContainerModelObj.value.allItemList.value[index];
            return AllItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTodaySOffer() {
    return SizedBox(
      height: 152.v,
      width: 330.h,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.h,
                vertical: 12.v,
              ),
              decoration: AppDecoration.outlineBlack.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 18.v),
                  Container(
                    width: 107.h,
                    margin: EdgeInsets.only(left: 8.h),
                    child: Text(
                      "lbl_today_s_offer".tr,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodyMediumAngkorYellowA400,
                    ),
                  ),
                  SizedBox(height: 7.v),
                  Container(
                    width: 223.h,
                    margin: EdgeInsets.only(left: 8.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "msg_munchies_launched2".tr,
                            style: CustomTextStyles
                                .bodyMediumAksaraBaliGalangWhiteA70001Regular,
                          ),
                          TextSpan(
                            text: " ",
                          ),
                          TextSpan(
                            text: "lbl_dish".tr,
                            style: CustomTextStyles
                                .bodyMediumAksaraBaliGalangYellowA400,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 8.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "lbl_ghc_25".tr,
                      style: CustomTextStyles.bodyMediumAlfaSlabOneYellowA400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgGrillChickenSpicy48x55,
            height: 79.v,
            width: 76.h,
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(right: 5.h),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBeefBurger() {
    return SizedBox(
      height: 152.v,
      child: Obx(
        () => ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 14.h),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 17.h,
            );
          },
          itemCount: controller.sfDashbordOneContainerModelObj.value
              .beefburgerItemList.value.length,
          itemBuilder: (context, index) {
            BeefburgerItemModel model = controller
                .sfDashbordOneContainerModelObj
                .value
                .beefburgerItemList
                .value[index];
            return BeefburgerItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGhcThirtyFive() {
    return SizedBox(
      height: 60.v,
      child: Obx(
        () => ListView.separated(
          padding: EdgeInsets.only(
            left: 19.h,
            right: 16.h,
          ),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 5.h,
            );
          },
          itemCount: controller.sfDashbordOneContainerModelObj.value
              .ghcthirtyfiveItemList.value.length,
          itemBuilder: (context, index) {
            GhcthirtyfiveItemModel model = controller
                .sfDashbordOneContainerModelObj
                .value
                .ghcthirtyfiveItemList
                .value[index];
            return GhcthirtyfiveItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }
}

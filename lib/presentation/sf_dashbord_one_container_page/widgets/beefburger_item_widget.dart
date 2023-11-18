import '../controller/sf_dashbord_one_container_controller.dart';
import '../models/beefburger_item_model.dart';
import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BeefburgerItemWidget extends StatelessWidget {
  BeefburgerItemWidget(
    this.beefburgerItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  BeefburgerItemModel beefburgerItemModelObj;

  var controller = Get.find<SfDashbordOneContainerController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 152.h,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.all(0),
        color: appTheme.gray20001,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Container(
          height: 152.adaptSize,
          width: 152.adaptSize,
          padding: EdgeInsets.symmetric(horizontal: 7.h),
          decoration: AppDecoration.outlineBlack900.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Obx(
                () => CustomImageView(
                  imagePath: beefburgerItemModelObj.beefBurger!.value,
                  height: 110.v,
                  width: 120.h,
                  alignment: Alignment.topCenter,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.v),
                  child: Obx(
                    () => Text(
                      beefburgerItemModelObj.beefBurger1!.value,
                      style: CustomTextStyles.titleSmallSemiBold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 15.h,
                    bottom: 3.v,
                  ),
                  child: Obx(
                    () => Text(
                      beefburgerItemModelObj.ghcTwenty!.value,
                      style: CustomTextStyles.titleSmallBlack900Bold,
                    ),
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgInfo,
                height: 18.adaptSize,
                width: 18.adaptSize,
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(bottom: 8.v),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

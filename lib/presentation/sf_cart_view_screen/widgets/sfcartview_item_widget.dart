import '../controller/sf_cart_view_controller.dart';
import '../models/sfcartview_item_model.dart';
import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SfcartviewItemWidget extends StatelessWidget {
  SfcartviewItemWidget(
    this.sfcartviewItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SfcartviewItemModel sfcartviewItemModelObj;

  var controller = Get.find<SfCartViewController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 13.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.outlineBlack9005.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 51.v,
            width: 68.h,
            margin: EdgeInsets.only(left: 3.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgBiCreditCard2FrontFill,
                  height: 11.v,
                  width: 15.h,
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 12.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgImage2,
                  height: 51.v,
                  width: 68.h,
                  radius: BorderRadius.circular(
                    34.h,
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 13.h,
              top: 2.v,
              bottom: 3.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    sfcartviewItemModelObj.waakye!.value,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Obx(
                    () => Text(
                      sfcartviewItemModelObj.ghcCounter!.value,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            height: 15.v,
            width: 16.h,
            margin: EdgeInsets.symmetric(vertical: 18.v),
            padding: EdgeInsets.all(3.h),
            decoration: AppDecoration.fillBlack.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgSearchWhiteA700019x9,
              height: 9.adaptSize,
              width: 9.adaptSize,
              alignment: Alignment.centerRight,
            ),
          ),
          Container(
            height: 15.adaptSize,
            width: 15.adaptSize,
            margin: EdgeInsets.only(
              left: 2.h,
              top: 18.v,
              bottom: 18.v,
            ),
            padding: EdgeInsets.all(3.h),
            decoration: AppDecoration.fillBlack.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder7,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgSearch9x9,
              height: 9.adaptSize,
              width: 9.adaptSize,
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}

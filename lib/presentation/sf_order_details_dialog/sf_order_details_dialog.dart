import 'controller/sf_order_details_controller.dart';
import 'package:canteenpreorder/core/app_export.dart';
import 'package:flutter/material.dart';

class SfOrderDetailsDialog extends StatelessWidget {
  SfOrderDetailsDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  SfOrderDetailsController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 313.h,
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 74.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgImage22,
                  height: 48.v,
                  width: 54.h,
                  radius: BorderRadius.circular(
                    27.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 5.h,
                    top: 7.v,
                    bottom: 14.v,
                  ),
                  child: Text(
                    "lbl_waakye".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.h,
                    top: 4.v,
                    bottom: 20.v,
                  ),
                  child: Text(
                    "lbl_ghc_30".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 56.v),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 37.v,
              width: 257.h,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgBiCreditCard2FrontFill,
                    height: 37.v,
                    width: 17.h,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 41.h),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.v),
                      child: Text(
                        "msg_some_information".tr,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32.v),
          Align(
            alignment: Alignment.center,
            child: Text(
              "msg_some_information".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 103.v),
          Padding(
            padding: EdgeInsets.only(
              left: 18.h,
              right: 42.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_delivery_option".tr,
                  style: CustomTextStyles.titleSmallBlack900,
                ),
                Text(
                  "lbl_pick_up2".tr,
                  style: CustomTextStyles.bodyMediumRegular14,
                ),
              ],
            ),
          ),
          SizedBox(height: 66.v),
          Container(
            height: 20.v,
            width: 67.h,
            margin: EdgeInsets.only(left: 105.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 20.v,
                    width: 67.h,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(
                        10.h,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "lbl_cancel".tr,
                    style: theme.textTheme.labelLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'controller/sf_payment_successful_controller.dart';
import 'package:canteenpreorder/core/app_export.dart';
import 'package:canteenpreorder/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class SfPaymentSuccessfulDialog extends StatelessWidget {
  SfPaymentSuccessfulDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  SfPaymentSuccessfulController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 323.h,
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 5.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          Padding(
            padding: EdgeInsets.only(left: 93.h),
            child: CustomIconButton(
              height: 72.adaptSize,
              width: 72.adaptSize,
              padding: EdgeInsets.all(24.h),
              decoration: IconButtonStyleHelper.outlineTeal,
              child: CustomImageView(
                imagePath: ImageConstant.imgCreditCard,
              ),
            ),
          ),
          SizedBox(height: 17.v),
          Container(
            width: 256.h,
            margin: EdgeInsets.only(right: 16.h),
            child: Text(
              "msg_your_payment_has".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style:
                  CustomTextStyles.headlineSmallLatoOnPrimaryContainer.copyWith(
                height: 1.33,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'controller/sf_confirm_payment_controller.dart';
import 'package:canteenpreorder/core/app_export.dart';
import 'package:flutter/material.dart';

class SfConfirmPaymentDialog extends StatelessWidget {
  SfConfirmPaymentDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  SfConfirmPaymentController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 324.h,
      padding: EdgeInsets.symmetric(
        horizontal: 21.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 11.v,
                width: 15.h,
                margin: EdgeInsets.only(
                  top: 8.v,
                  bottom: 13.v,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 11.v,
                        width: 15.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            7.h,
                          ),
                          border: Border.all(
                            color: theme.colorScheme.primary,
                            width: 1.h,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 5.v,
                        width: 7.h,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(
                            3.h,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 31.v,
                width: 41.h,
                margin: EdgeInsets.only(
                  left: 12.h,
                  bottom: 2.v,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 11.h,
                  vertical: 8.v,
                ),
                decoration: AppDecoration.fillOrange.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder9,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgBiCreditCard2FrontFillWhiteA700,
                  height: 12.v,
                  width: 16.h,
                  alignment: Alignment.topRight,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 11.h,
                  top: 7.v,
                ),
                child: Text(
                  "lbl_card".tr,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ],
          ),
          SizedBox(height: 9.v),
          Opacity(
            opacity: 0.3,
            child: Align(
              alignment: Alignment.center,
              child: Divider(
                indent: 27.h,
                endIndent: 14.h,
              ),
            ),
          ),
          SizedBox(height: 11.v),
          Padding(
            padding: EdgeInsets.only(right: 82.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 11.v,
                  width: 15.h,
                  margin: EdgeInsets.only(
                    top: 8.v,
                    bottom: 15.v,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      7.h,
                    ),
                    border: Border.all(
                      color: appTheme.gray500,
                      width: 1.h,
                    ),
                  ),
                ),
                Container(
                  height: 31.v,
                  width: 41.h,
                  margin: EdgeInsets.only(
                    left: 12.h,
                    bottom: 4.v,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.h,
                    vertical: 6.v,
                  ),
                  decoration: AppDecoration.fillYellowA.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder9,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgDashiconsBank,
                    height: 15.v,
                    width: 20.h,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 11.h,
                    top: 8.v,
                  ),
                  child: Text(
                    "lbl_mobile_money".tr,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 38.v),
        ],
      ),
    );
  }
}

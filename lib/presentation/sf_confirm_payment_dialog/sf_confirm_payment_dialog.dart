import 'controller/sf_confirm_payment_controller.dart';
import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/widgets/custom_radio_button.dart';
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
          Obx(
            () => Padding(
              padding: EdgeInsets.only(right: 14.h),
              child: CustomRadioButton(
                text: "lbl_card".tr,
                value: "lbl_card".tr,
                groupValue: controller.radioGroup.value,
                padding: EdgeInsets.fromLTRB(9.h, 7.v, 30.h, 7.v),
                onChange: (value) {
                  controller.radioGroup.value = value;
                },
              ),
            ),
          ),
          SizedBox(height: 11.v),
          Row(
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
                    color: appTheme.gray50002,
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
                  horizontal: 8.h,
                  vertical: 6.v,
                ),
                decoration: AppDecoration.fillOrange.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgDashiconsBank,
                  height: 15.v,
                  width: 20.h,
                  alignment: Alignment.topLeft,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 9.h,
                  top: 8.v,
                ),
                child: Text(
                  "lbl_mobile_money".tr,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ],
          ),
          SizedBox(height: 38.v),
        ],
      ),
    );
  }
}

import 'controller/sf_delivery_option_controller.dart';
import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SfDeliveryOptionDialog extends StatelessWidget {
  SfDeliveryOptionDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  SfDeliveryOptionController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 315.h,
      padding: EdgeInsets.symmetric(
        horizontal: 30.h,
        vertical: 19.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          Padding(
            padding: EdgeInsets.only(right: 23.h),
            child: CustomTextFormField(
              controller: controller.kofiJoeController,
              hintText: "lbl_kofi_joe".tr,
              textInputAction: TextInputAction.done,
            ),
          ),
          SizedBox(height: 8.v),
          SizedBox(
            width: 135.h,
            child: Text(
              "msg_hostel_2d_room_i9_ashesi".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumRegular_1,
            ),
          ),
          Opacity(
            opacity: 0.3,
            child: Divider(
              color: appTheme.black900.withOpacity(0.46),
              endIndent: 23.h,
            ),
          ),
          SizedBox(height: 7.v),
          Text(
            "lbl_233_9011039271".tr,
            style: CustomTextStyles.bodyMediumRegular_1,
          ),
        ],
      ),
    );
  }
}

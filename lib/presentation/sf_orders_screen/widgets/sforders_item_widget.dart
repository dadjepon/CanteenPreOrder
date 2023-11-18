import '../controller/sf_orders_controller.dart';
import '../models/sforders_item_model.dart';
import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SfordersItemWidget extends StatelessWidget {
  SfordersItemWidget(
    this.sfordersItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SfordersItemModel sfordersItemModelObj;

  var controller = Get.find<SfOrdersController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 118.v,
      width: 329.h,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(
                left: 2.h,
                top: 24.v,
                right: 14.h,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 7.h,
                vertical: 8.v,
              ),
              decoration: AppDecoration.outlineBlack9005.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Row(
                children: [
                  Container(
                    height: 75.v,
                    width: 225.h,
                    margin: EdgeInsets.only(bottom: 1.v),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Obx(
                          () => CustomImageView(
                            imagePath: sfordersItemModelObj.image!.value,
                            height: 14.v,
                            width: 15.h,
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 50.h),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 1.v),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 1.v),
                                  child: Obx(
                                    () => Text(
                                      sfordersItemModelObj.waakye!.value,
                                      style: theme.textTheme.titleMedium,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 29.h,
                                    bottom: 4.v,
                                  ),
                                  child: Obx(
                                    () => Text(
                                      sfordersItemModelObj.ghcCounter!.value,
                                      style: theme.textTheme.titleSmall,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Obx(
                          () => CustomImageView(
                            imagePath: sfordersItemModelObj.circleImage!.value,
                            height: 48.v,
                            width: 54.h,
                            radius: BorderRadius.circular(
                              27.h,
                            ),
                            alignment: Alignment.topLeft,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 131.h,
                            margin: EdgeInsets.only(right: 31.h),
                            child: Obx(
                              () => Text(
                                sfordersItemModelObj.someInformation!.value,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 23.v,
                    width: 59.h,
                    margin: EdgeInsets.only(
                      left: 11.h,
                      top: 50.v,
                      bottom: 1.v,
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 23.v,
                            width: 59.h,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(
                                11.h,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Obx(
                            () => Text(
                              sfordersItemModelObj.cancel!.value,
                              style: theme.textTheme.labelLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => CustomImageView(
              imagePath: sfordersItemModelObj.ready!.value,
              height: 79.v,
              width: 85.h,
              alignment: Alignment.topRight,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                top: 33.v,
                right: 21.h,
              ),
              child: Obx(
                () => Text(
                  sfordersItemModelObj.ready1!.value,
                  style: theme.textTheme.labelMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import '../controller/sf_cart_view_controller.dart';
import '../models/slidablelist_item_model.dart';
import 'package:canteenpreorder/core/app_export.dart';
import 'package:canteenpreorder/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class SlidablelistItemWidget extends StatelessWidget {
  SlidablelistItemWidget(
    this.slidablelistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SlidablelistItemModel slidablelistItemModelObj;

  var controller = Get.find<SfCartViewController>();

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        extentRatio: 0.41,
        dragDismissible: false,
        children: [
          Container(
            margin: EdgeInsets.only(left: 8.h),
            height: 35.v,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomIconButton(
                  height: 35.v,
                  width: 34.h,
                  padding: EdgeInsets.all(9.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgGroup8,
                  ),
                ),
                Container(
                  height: 34.v,
                  width: 31.h,
                  margin: EdgeInsets.only(left: 5.h),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 34.v,
                          width: 31.h,
                          decoration: BoxDecoration(
                            color: appTheme.black900,
                            borderRadius: BorderRadius.circular(
                              17.h,
                            ),
                          ),
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgVector,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 5.h),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 11.v,
        ),
        decoration: AppDecoration.outlineBlack900.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 51.v,
              width: 68.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgBiCreditCard2FrontFillWhiteA700,
                    height: 11.v,
                    width: 15.h,
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(right: 12.h),
                  ),
                  Obx(
                    () => CustomImageView(
                      imagePath: slidablelistItemModelObj.imageTwo!.value,
                      height: 51.v,
                      width: 68.h,
                      radius: BorderRadius.circular(
                        34.h,
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 46.v,
              width: 75.h,
              margin: EdgeInsets.only(
                left: 13.h,
                top: 2.v,
                bottom: 3.v,
              ),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Obx(
                      () => Text(
                        slidablelistItemModelObj.waakye!.value,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Obx(
                        () => Text(
                          slidablelistItemModelObj.ghcCounter!.value,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: 23.v,
              width: 50.h,
              margin: EdgeInsets.only(top: 26.v),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 1.v),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.h,
                        vertical: 1.v,
                      ),
                      decoration: AppDecoration.fillPrimary.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder9,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 2.v),
                          Obx(
                            () => Text(
                              slidablelistItemModelObj.text!.value,
                              style: theme.textTheme.labelMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 6.h),
                      child: Row(
                        children: [
                          Obx(
                            () => Text(
                              slidablelistItemModelObj.text1!.value,
                              style: CustomTextStyles.titleSmallGray100,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 6.h,
                              top: 3.v,
                            ),
                            child: Obx(
                              () => Text(
                                slidablelistItemModelObj.one!.value,
                                style: theme.textTheme.labelLarge,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

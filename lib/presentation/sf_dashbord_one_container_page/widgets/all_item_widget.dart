import '../controller/sf_dashbord_one_container_controller.dart';
import '../models/all_item_model.dart';
import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AllItemWidget extends StatelessWidget {
  AllItemWidget(
    this.allItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  AllItemModel allItemModelObj;

  var controller = Get.find<SfDashbordOneContainerController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 79.v,
      width: 75.h,
      margin: EdgeInsets.only(top: 1.v),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 11.h,
              margin: EdgeInsets.only(right: 29.h),
              child: Obx(
                () => Text(
                  allItemModelObj.all!.value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 53.v,
              width: 75.h,
              padding: EdgeInsets.symmetric(horizontal: 8.h),
              decoration: AppDecoration.fillPrimary.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder15,
              ),
              child: Obx(
                () => CustomImageView(
                  imagePath: allItemModelObj.all1!.value,
                  height: 48.v,
                  width: 55.h,
                  alignment: Alignment.topRight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

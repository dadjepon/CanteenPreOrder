import '../controller/sf_dashbord_one_container_controller.dart';
import '../models/ghcthirtyfive_item_model.dart';
import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GhcthirtyfiveItemWidget extends StatelessWidget {
  GhcthirtyfiveItemWidget(
    this.ghcthirtyfiveItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  GhcthirtyfiveItemModel ghcthirtyfiveItemModelObj;

  var controller = Get.find<SfDashbordOneContainerController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.v,
      width: 101.h,
      margin: EdgeInsets.only(bottom: 3.v),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.only(bottom: 1.v),
              color: theme.colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Container(
                height: 50.v,
                width: 100.h,
                padding: EdgeInsets.symmetric(horizontal: 4.h),
                decoration: AppDecoration.outlineBlack9002.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 1.v),
                        child: Obx(
                          () => Text(
                            ghcthirtyfiveItemModelObj.ghcThirtyFive!.value,
                            style: theme.textTheme.labelSmall,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => CustomImageView(
                        imagePath: ghcthirtyfiveItemModelObj.ghc!.value,
                        height: 50.v,
                        width: 41.h,
                        alignment: Alignment.center,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 25.h,
                        margin: EdgeInsets.only(top: 3.v),
                        child: Obx(
                          () => Text(
                            ghcthirtyfiveItemModelObj.kingSize!.value,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.aksaraBaliGalangWhiteA70001,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 11.v),
                        child: Obx(
                          () => Text(
                            ghcthirtyfiveItemModelObj.burger!.value,
                            style: CustomTextStyles.poppinsWhiteA70001,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => Text(
                          ghcthirtyfiveItemModelObj.fries!.value,
                          style: CustomTextStyles.poppinsWhiteA70001SemiBold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 14.v),
                        child: Obx(
                          () => Text(
                            ghcthirtyfiveItemModelObj.coke!.value,
                            style: CustomTextStyles.poppinsWhiteA70001SemiBold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => CustomImageView(
              imagePath: ghcthirtyfiveItemModelObj.ghc1!.value,
              height: 50.v,
              width: 14.h,
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: 10.h),
            ),
          ),
          Obx(
            () => CustomImageView(
              imagePath: ghcthirtyfiveItemModelObj.ghc2!.value,
              height: 45.v,
              width: 50.h,
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(right: 11.h),
            ),
          ),
        ],
      ),
    );
  }
}

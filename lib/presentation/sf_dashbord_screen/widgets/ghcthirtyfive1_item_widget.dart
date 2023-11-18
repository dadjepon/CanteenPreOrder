import '../controller/sf_dashbord_controller.dart';
import '../models/ghcthirtyfive1_item_model.dart';
import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Ghcthirtyfive1ItemWidget extends StatelessWidget {
  Ghcthirtyfive1ItemWidget(
    this.ghcthirtyfive1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Ghcthirtyfive1ItemModel ghcthirtyfive1ItemModelObj;

  var controller = Get.find<SfDashbordController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.v,
      width: 100.h,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              color: appTheme.whiteA70001,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Container(
                height: 50.v,
                width: 100.h,
                padding: EdgeInsets.symmetric(horizontal: 4.h),
                decoration: AppDecoration.outlineBlack9003.copyWith(
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
                            ghcthirtyfive1ItemModelObj.ghcThirtyFive!.value,
                            style: theme.textTheme.labelSmall,
                          ),
                        ),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgFries1111,
                      height: 50.v,
                      width: 41.h,
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 25.h,
                        margin: EdgeInsets.only(top: 3.v),
                        child: Obx(
                          () => Text(
                            ghcthirtyfive1ItemModelObj.kingSize!.value,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.aksaraBaliGalangBlack900,
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
                            ghcthirtyfive1ItemModelObj.burger!.value,
                            style: CustomTextStyles.poppinsBlack900,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => Text(
                          ghcthirtyfive1ItemModelObj.fries!.value,
                          style: CustomTextStyles.poppinsBlack900SemiBold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 14.v),
                        child: Obx(
                          () => Text(
                            ghcthirtyfive1ItemModelObj.coke!.value,
                            style: CustomTextStyles.poppinsBlack900SemiBold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgCocaColaBottle19,
            height: 50.v,
            width: 14.h,
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(right: 9.h),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgChickenburger1,
            height: 45.v,
            width: 50.h,
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 6.h),
          ),
        ],
      ),
    );
  }
}

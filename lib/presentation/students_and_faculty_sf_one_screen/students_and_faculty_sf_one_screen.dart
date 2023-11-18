import 'controller/students_and_faculty_sf_one_controller.dart';
import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class StudentsAndFacultySfOneScreen
    extends GetWidget<StudentsAndFacultySfOneController> {
  const StudentsAndFacultySfOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0.5),
              end: Alignment(0.5, 1.01),
              colors: [
                theme.colorScheme.onErrorContainer,
                theme.colorScheme.onPrimaryContainer,
              ],
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 54.h,
              vertical: 1.v,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 435.v,
                  width: 281.h,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 254.v,
                          width: 281.h,
                          decoration: BoxDecoration(
                            color: appTheme.gray200,
                            borderRadius: BorderRadius.circular(
                              140.h,
                            ),
                          ),
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgGrillChickenSpicy,
                        height: 245.v,
                        width: 246.h,
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(bottom: 14.v),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgScreenshot2023,
                        height: 182.v,
                        width: 237.h,
                        alignment: Alignment.topCenter,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 51.v),
                Container(
                  width: 201.h,
                  margin: EdgeInsets.only(
                    left: 39.h,
                    right: 41.h,
                  ),
                  child: Text(
                    "msg_order_your_meal".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineLarge,
                  ),
                ),
                Spacer(
                  flex: 50,
                ),
                CustomElevatedButton(
                  height: 50.v,
                  text: "lbl_get_started".tr,
                  margin: EdgeInsets.symmetric(horizontal: 21.h),
                  buttonStyle: CustomButtonStyles.fillWhiteA,
                  buttonTextStyle: CustomTextStyles.headlineSmallMochiyPopOne,
                  onPressed: () {
                    onTapGetStartedButton();
                  },
                ),
                Spacer(
                  flex: 49,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapGetStartedButton() {
    Get.toNamed(AppRoutes.sfDashbordOneContainer1Screen);
  }
}

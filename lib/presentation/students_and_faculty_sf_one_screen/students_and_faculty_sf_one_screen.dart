import 'controller/students_and_faculty_sf_one_controller.dart';
import 'package:canteenpreorder/core/app_export.dart';
import 'package:canteenpreorder/widgets/custom_elevated_button.dart';
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
                theme.colorScheme.secondaryContainer,
              ],
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 54.h,
              vertical: 61.v,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 99.v,
                    width: 210.h,
                    margin: EdgeInsets.only(right: 21.h),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "lbl_f".tr,
                                  style: CustomTextStyles
                                      .displaySmallMochiyPopOneYellowA400_1,
                                ),
                                TextSpan(
                                  text: "lbl_ood".tr,
                                  style: CustomTextStyles
                                      .displaySmallMochiyPopOneWhiteA700,
                                ),
                                TextSpan(
                                  text: "lbl_e".tr,
                                  style: CustomTextStyles
                                      .displaySmallMochiyPopOneYellowA400_1,
                                ),
                                TextSpan(
                                  text: "lbl_ase".tr,
                                  style: CustomTextStyles
                                      .displaySmallMochiyPopOneWhiteA700,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "lbl_logo".tr,
                            style: CustomTextStyles.displaySmallWhiteA700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.v),
                SizedBox(
                  height: 254.v,
                  width: 281.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 254.v,
                          width: 281.h,
                          decoration: BoxDecoration(
                            color: appTheme.whiteA700,
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
                        alignment: Alignment.center,
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
                Spacer(),
                SizedBox(height: 44.v),
                CustomElevatedButton(
                  text: "lbl_get_started".tr,
                  margin: EdgeInsets.symmetric(horizontal: 21.h),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

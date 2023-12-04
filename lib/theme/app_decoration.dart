import 'package:canteen_preorderapp/core/utils/size_utils.dart';

import 'package:canteen_preorderapp/theme/theme_helper.dart';

import 'package:flutter/material.dart';


class AppDecoration {

  // Fill decorations

  static BoxDecoration get fillBlueGray => BoxDecoration(

        color: appTheme.blueGray10001,

      );

  static BoxDecoration get fillGray => BoxDecoration(

        color: appTheme.gray500,

      );

  static BoxDecoration get fillGray400 => BoxDecoration(

        color: appTheme.gray400,

      );

  static BoxDecoration get fillOnErrorContainer => BoxDecoration(

        color: theme.colorScheme.onErrorContainer.withOpacity(1),

      );

  static BoxDecoration get fillOnPrimary => BoxDecoration(

        color: theme.colorScheme.onPrimary,

      );

  static BoxDecoration get fillPrimary => BoxDecoration(

        color: theme.colorScheme.primary,

      );

  static BoxDecoration get fillWhiteA => BoxDecoration(

        color: appTheme.whiteA700,

      );


  // Gradient decorations

  static BoxDecoration get gradientGrayToSecondaryContainer => BoxDecoration(

        gradient: LinearGradient(

          begin: Alignment(0.5, 0.5),

          end: Alignment(0.5, 1.01),

          colors: [

            appTheme.gray40001,

            theme.colorScheme.secondaryContainer,

          ],

        ),

      );


  // Outline decorations

  static BoxDecoration get outlineBlueGray => BoxDecoration();

  static BoxDecoration get outlineGray => BoxDecoration(

        color: appTheme.whiteA700,

        border: Border.all(

          color: appTheme.gray100,

          width: 1.h,

        ),

      );

  static BoxDecoration get outlineOnErrorContainer => BoxDecoration(

        color: appTheme.whiteA700,

        border: Border.all(

          color: theme.colorScheme.onErrorContainer.withOpacity(1),

          width: 1.h,

        ),

      );

  static BoxDecoration get outlineOnErrorContainer1 => BoxDecoration(

        color: theme.colorScheme.primary,

        boxShadow: [

          BoxShadow(

            color: theme.colorScheme.onErrorContainer.withOpacity(0.4),

            spreadRadius: 2.h,

            blurRadius: 2.h,

            offset: Offset(

              0,

              1.74,

            ),

          ),

        ],

      );

  static BoxDecoration get outlineOnErrorContainer2 => BoxDecoration(

        color: appTheme.whiteA700,

        boxShadow: [

          BoxShadow(

            color: theme.colorScheme.onErrorContainer.withOpacity(0.25),

            spreadRadius: 2.h,

            blurRadius: 2.h,

            offset: Offset(

              0,

              1.6,

            ),

          ),

        ],

      );

  static BoxDecoration get outlineOnErrorContainer3 => BoxDecoration(

        color: appTheme.whiteA700,

        boxShadow: [

          BoxShadow(

            color: theme.colorScheme.onErrorContainer,

            spreadRadius: 2.h,

            blurRadius: 2.h,

            offset: Offset(

              0,

              10,

            ),

          ),

        ],

      );


  // Row decorations

  static BoxDecoration get row12 => BoxDecoration();

}


class BorderRadiusStyle {

  // Circle borders

  static BorderRadius get circleBorder15 => BorderRadius.circular(

        15.h,

      );

  static BorderRadius get circleBorder45 => BorderRadius.circular(

        45.h,

      );


  // Custom borders

  static BorderRadius get customBorderBL11 => BorderRadius.only(

        topLeft: Radius.circular(4.h),

        topRight: Radius.circular(4.h),

        bottomLeft: Radius.circular(11.h),

        bottomRight: Radius.circular(11.h),

      );

  static BorderRadius get customBorderBL20 => BorderRadius.vertical(

        bottom: Radius.circular(20.h),

      );

  static BorderRadius get customNormal => BorderRadius.vertical();

  static BorderRadius get customBorderTL22 => BorderRadius.vertical(

        top: Radius.circular(22.h),

      );


  // Rounded borders

  static BorderRadius get roundedBorder11 => BorderRadius.circular(

        11.h,

      );

  static BorderRadius get roundedBorder2 => BorderRadius.circular(

        2.h,

      );

  static BorderRadius get roundedBorder20 => BorderRadius.circular(

        20.h,

      );

  static BorderRadius get roundedBorder28 => BorderRadius.circular(

        28.h,

      );

  static BorderRadius get roundedBorder5 => BorderRadius.circular(

        5.h,

      );

}


// Comment/Uncomment the below code based on your Flutter SDK version.


// For Flutter SDK Version 3.7.2 or greater.


double get strokeAlignInside => BorderSide.strokeAlignInside;


double get strokeAlignCenter => BorderSide.strokeAlignCenter;


double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;

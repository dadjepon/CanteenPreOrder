import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900.withOpacity(0.53),
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumMochiyPopOne =>
      theme.textTheme.bodyMedium!.mochiyPopOne.copyWith(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumRegular => theme.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumRegular14 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
      );
  // Display text style
  static get displaySmallMochiyPopOneWhiteA700 =>
      theme.textTheme.displaySmall!.mochiyPopOne.copyWith(
        color: appTheme.whiteA700,
      );
  static get displaySmallMochiyPopOneYellowA400 =>
      theme.textTheme.displaySmall!.mochiyPopOne.copyWith(
        color: appTheme.yellowA400,
      );
  static get displaySmallMochiyPopOneYellowA400_1 =>
      theme.textTheme.displaySmall!.mochiyPopOne.copyWith(
        color: appTheme.yellowA400,
      );
  static get displaySmallWhiteA700 => theme.textTheme.displaySmall!.copyWith(
        color: appTheme.whiteA700,
      );
  // Headline text style
  static get headlineSmallLatoOnPrimaryContainer =>
      theme.textTheme.headlineSmall!.lato.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w700,
      );
  static get headlineSmallMochiyPopOne =>
      theme.textTheme.headlineSmall!.mochiyPopOne.copyWith(
        fontWeight: FontWeight.w400,
      );
  // Label text style
  static get labelMediumWhiteA700 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 11.fSize,
        fontWeight: FontWeight.w800,
      );
  static get labelMediumWhiteA700ExtraBold =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w800,
      );
  // Title text style
  static get titleLargeBlack => theme.textTheme.titleLarge!.copyWith(
        fontSize: 22.fSize,
        fontWeight: FontWeight.w900,
      );
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
      );
  static get titleMediumGray10001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray10001,
      );
  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallGray100 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray100,
      );
}

extension on TextStyle {
  TextStyle get lato {
    return copyWith(
      fontFamily: 'Lato',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get modak {
    return copyWith(
      fontFamily: 'Modak',
    );
  }

  TextStyle get mochiyPopOne {
    return copyWith(
      fontFamily: 'Mochiy Pop One',
    );
  }
}

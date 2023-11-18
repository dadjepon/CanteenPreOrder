import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Aksara text style
  static get aksaraBaliGalangBlack900 => TextStyle(
        color: appTheme.black900,
        fontSize: 6.fSize,
        fontWeight: FontWeight.w400,
      ).aksaraBaliGalang;
  static get aksaraBaliGalangWhiteA70001 => TextStyle(
        color: appTheme.whiteA70001,
        fontSize: 6.fSize,
        fontWeight: FontWeight.w400,
      ).aksaraBaliGalang;
  // Body text style
  static get bodyMediumAksaraBaliGalangWhiteA70001 =>
      theme.textTheme.bodyMedium!.aksaraBaliGalang.copyWith(
        color: appTheme.whiteA70001,
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumAksaraBaliGalangWhiteA70001Regular =>
      theme.textTheme.bodyMedium!.aksaraBaliGalang.copyWith(
        color: appTheme.whiteA70001,
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumAksaraBaliGalangYellowA400 =>
      theme.textTheme.bodyMedium!.aksaraBaliGalang.copyWith(
        color: appTheme.yellowA400,
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumAlfaSlabOneYellowA400 =>
      theme.textTheme.bodyMedium!.alfaSlabOne.copyWith(
        color: appTheme.yellowA400,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumAngkorYellowA400 =>
      theme.textTheme.bodyMedium!.angkor.copyWith(
        color: appTheme.yellowA400,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900.withOpacity(0.53),
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumGray500 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray500,
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumMochiyPopOne =>
      theme.textTheme.bodyMedium!.mochiyPopOne.copyWith(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumMochiyPopOnePrimary =>
      theme.textTheme.bodyMedium!.mochiyPopOne.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumRegular => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumRegular_1 => theme.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get bodySmallPoppins => theme.textTheme.bodySmall!.poppins;
  static get bodySmallPoppinsGray400 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.gray400,
        fontSize: 12.fSize,
      );
  // Headline text style
  static get headlineSmallBlack => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w900,
      );
  static get headlineSmallMochiyPopOne =>
      theme.textTheme.headlineSmall!.mochiyPopOne.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get headlineSmallPrimary => theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  // Label text style
  static get labelMedium10 => theme.textTheme.labelMedium!.copyWith(
        fontSize: 10.fSize,
      );
  // Poppins text style
  static get poppinsBlack900 => TextStyle(
        color: appTheme.black900,
        fontSize: 6.fSize,
        fontWeight: FontWeight.w600,
      ).poppins;
  static get poppinsBlack900SemiBold => TextStyle(
        color: appTheme.black900,
        fontSize: 5.fSize,
        fontWeight: FontWeight.w600,
      ).poppins;
  static get poppinsWhiteA70001 => TextStyle(
        color: appTheme.whiteA70001,
        fontSize: 6.fSize,
        fontWeight: FontWeight.w600,
      ).poppins;
  static get poppinsWhiteA70001SemiBold => TextStyle(
        color: appTheme.whiteA70001,
        fontSize: 5.fSize,
        fontWeight: FontWeight.w600,
      ).poppins;
  // Title text style
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w800,
      );
  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
      );
  static get titleMediumGray100 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray100,
      );
  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallBlack900Bold => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallSemiBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleSmallYellowA400 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.yellowA400,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );
}

extension on TextStyle {
  TextStyle get mochiyPopOne {
    return copyWith(
      fontFamily: 'Mochiy Pop One',
    );
  }

  TextStyle get angkor {
    return copyWith(
      fontFamily: 'Angkor',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get alfaSlabOne {
    return copyWith(
      fontFamily: 'Alfa Slab One',
    );
  }

  TextStyle get aksaraBaliGalang {
    return copyWith(
      fontFamily: 'Aksara Bali Galang',
    );
  }
}

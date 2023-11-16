import '../../../core/app_export.dart';

/// This class is used in the [slidablelist_item_widget] screen.
class SlidablelistItemModel {
  SlidablelistItemModel({
    this.imageTwo,
    this.waakye,
    this.ghcCounter,
    this.text,
    this.text1,
    this.one,
    this.id,
  }) {
    imageTwo = imageTwo ?? Rx(ImageConstant.imgImage2);
    waakye = waakye ?? Rx("Waakye");
    ghcCounter = ghcCounter ?? Rx("Ghc 30");
    text = text ?? Rx("+");
    text1 = text1 ?? Rx("-");
    one = one ?? Rx("1");
    id = id ?? Rx("");
  }

  Rx<String>? imageTwo;

  Rx<String>? waakye;

  Rx<String>? ghcCounter;

  Rx<String>? text;

  Rx<String>? text1;

  Rx<String>? one;

  Rx<String>? id;
}

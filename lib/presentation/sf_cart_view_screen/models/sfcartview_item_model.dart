import '../../../core/app_export.dart';

/// This class is used in the [sfcartview_item_widget] screen.
class SfcartviewItemModel {
  SfcartviewItemModel({
    this.waakye,
    this.ghcCounter,
    this.id,
  }) {
    waakye = waakye ?? Rx("Waakye");
    ghcCounter = ghcCounter ?? Rx("Ghc 30");
    id = id ?? Rx("");
  }

  Rx<String>? waakye;

  Rx<String>? ghcCounter;

  Rx<String>? id;
}

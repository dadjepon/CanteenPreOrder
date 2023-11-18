import '../../../core/app_export.dart';

/// This class is used in the [sforders_item_widget] screen.
class SfordersItemModel {
  SfordersItemModel({
    this.image,
    this.waakye,
    this.ghcCounter,
    this.circleImage,
    this.someInformation,
    this.cancel,
    this.ready,
    this.ready1,
    this.id,
  }) {
    image = image ?? Rx(ImageConstant.imgBiCreditCard2FrontFill);
    waakye = waakye ?? Rx("Waakye");
    ghcCounter = ghcCounter ?? Rx("Ghc 30");
    circleImage = circleImage ?? Rx(ImageConstant.imgImage248x54);
    someInformation =
        someInformation ?? Rx("Some information about  the order");
    cancel = cancel ?? Rx("cancel");
    ready = ready ?? Rx(ImageConstant.imgStarburstShape);
    ready1 = ready1 ?? Rx("READY");
    id = id ?? Rx("");
  }

  Rx<String>? image;

  Rx<String>? waakye;

  Rx<String>? ghcCounter;

  Rx<String>? circleImage;

  Rx<String>? someInformation;

  Rx<String>? cancel;

  Rx<String>? ready;

  Rx<String>? ready1;

  Rx<String>? id;
}

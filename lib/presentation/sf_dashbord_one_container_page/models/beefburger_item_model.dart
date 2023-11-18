import '../../../core/app_export.dart';

/// This class is used in the [beefburger_item_widget] screen.
class BeefburgerItemModel {
  BeefburgerItemModel({
    this.beefBurger,
    this.beefBurger1,
    this.ghcTwenty,
    this.id,
  }) {
    beefBurger = beefBurger ?? Rx(ImageConstant.imgFastFoodBurger5);
    beefBurger1 = beefBurger1 ?? Rx("Beef Burger");
    ghcTwenty = ghcTwenty ?? Rx("Ghc20/");
    id = id ?? Rx("");
  }

  Rx<String>? beefBurger;

  Rx<String>? beefBurger1;

  Rx<String>? ghcTwenty;

  Rx<String>? id;
}

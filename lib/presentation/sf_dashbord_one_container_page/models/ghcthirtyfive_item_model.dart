import '../../../core/app_export.dart';

/// This class is used in the [ghcthirtyfive_item_widget] screen.
class GhcthirtyfiveItemModel {
  GhcthirtyfiveItemModel({
    this.ghcThirtyFive,
    this.ghc,
    this.kingSize,
    this.burger,
    this.fries,
    this.coke,
    this.ghc1,
    this.ghc2,
    this.id,
  }) {
    ghcThirtyFive = ghcThirtyFive ?? Rx("Ghc35/");
    ghc = ghc ?? Rx(ImageConstant.imgFries1111);
    kingSize = kingSize ?? Rx("King Size");
    burger = burger ?? Rx("BURGER");
    fries = fries ?? Rx("+ Fries");
    coke = coke ?? Rx("+ Coke ");
    ghc1 = ghc1 ?? Rx(ImageConstant.imgCocaColaBottle19);
    ghc2 = ghc2 ?? Rx(ImageConstant.imgChickenburger1);
    id = id ?? Rx("");
  }

  Rx<String>? ghcThirtyFive;

  Rx<String>? ghc;

  Rx<String>? kingSize;

  Rx<String>? burger;

  Rx<String>? fries;

  Rx<String>? coke;

  Rx<String>? ghc1;

  Rx<String>? ghc2;

  Rx<String>? id;
}

import '../../../core/app_export.dart';

/// This class is used in the [ghcthirtyfive1_item_widget] screen.
class Ghcthirtyfive1ItemModel {
  Ghcthirtyfive1ItemModel({
    this.ghcThirtyFive,
    this.kingSize,
    this.burger,
    this.fries,
    this.coke,
    this.id,
  }) {
    ghcThirtyFive = ghcThirtyFive ?? Rx("Ghc35/");
    kingSize = kingSize ?? Rx("King Size");
    burger = burger ?? Rx("BURGER");
    fries = fries ?? Rx("+ Fries");
    coke = coke ?? Rx("+ Coke ");
    id = id ?? Rx("");
  }

  Rx<String>? ghcThirtyFive;

  Rx<String>? kingSize;

  Rx<String>? burger;

  Rx<String>? fries;

  Rx<String>? coke;

  Rx<String>? id;
}

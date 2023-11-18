import '../../../core/app_export.dart';

/// This class is used in the [all_item_widget] screen.
class AllItemModel {
  AllItemModel({
    this.all,
    this.all1,
    this.id,
  }) {
    all = all ?? Rx("All");
    all1 = all1 ?? Rx(ImageConstant.imgGrillChickenSpicy48x55);
    id = id ?? Rx("");
  }

  Rx<String>? all;

  Rx<String>? all1;

  Rx<String>? id;
}

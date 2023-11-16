import '../../../core/app_export.dart';
import 'slidablelist_item_model.dart';

/// This class defines the variables used in the [sf_cart_view_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SfCartViewModel {
  Rx<List<SlidablelistItemModel>> slidablelistItemList = Rx([
    SlidablelistItemModel(
        imageTwo: ImageConstant.imgImage2.obs,
        waakye: "Waakye".obs,
        ghcCounter: "Ghc 30".obs,
        text: "+".obs,
        text1: "-".obs,
        one: "1".obs),
    SlidablelistItemModel(
        imageTwo: ImageConstant.imgImage251x68.obs,
        waakye: "Waakye".obs,
        ghcCounter: "Ghc 30".obs,
        text: "+".obs,
        text1: "-".obs,
        one: "1".obs),
    SlidablelistItemModel(
        waakye: "Waakye".obs,
        ghcCounter: "Ghc 30".obs,
        text: "+".obs,
        text1: "-".obs,
        one: "1".obs)
  ]);
}

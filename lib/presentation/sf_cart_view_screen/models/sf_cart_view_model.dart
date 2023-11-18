import '../../../core/app_export.dart';
import 'sfcartview_item_model.dart';

/// This class defines the variables used in the [sf_cart_view_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SfCartViewModel {
  Rx<List<SfcartviewItemModel>> sfcartviewItemList = Rx([
    SfcartviewItemModel(waakye: "Waakye".obs, ghcCounter: "Ghc 30".obs),
    SfcartviewItemModel(waakye: "Waakye".obs, ghcCounter: "Ghc 30".obs)
  ]);
}

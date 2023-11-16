import '../../../core/app_export.dart';
import 'sforders_item_model.dart';

/// This class defines the variables used in the [sf_orders_page],
/// and is typically used to hold data that is passed between different parts of the application.
class SfOrdersModel {
  Rx<List<SfordersItemModel>> sfordersItemList = Rx([
    SfordersItemModel(
        image: ImageConstant.imgBiCreditCard2FrontFillWhiteA700.obs,
        waakye: "Waakye".obs,
        ghcCounter: "Ghc 30".obs,
        circleImage: ImageConstant.imgImage248x54.obs,
        someInformation: "Some information about  the order".obs,
        cancel: "cancel".obs,
        ready: ImageConstant.imgStarburstShape.obs,
        ready1: "READY".obs)
  ]);
}

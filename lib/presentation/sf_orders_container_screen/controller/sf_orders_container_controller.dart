import 'package:canteenpreorder/core/app_export.dart';
import 'package:canteenpreorder/presentation/sf_orders_container_screen/models/sf_orders_container_model.dart';

/// A controller class for the SfOrdersContainerScreen.
///
/// This class manages the state of the SfOrdersContainerScreen, including the
/// current sfOrdersContainerModelObj
class SfOrdersContainerController extends GetxController {
  Rx<SfOrdersContainerModel> sfOrdersContainerModelObj =
      SfOrdersContainerModel().obs;
}

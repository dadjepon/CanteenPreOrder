import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/presentation/sf_orders_screen/models/sf_orders_model.dart';

/// A controller class for the SfOrdersScreen.
///
/// This class manages the state of the SfOrdersScreen, including the
/// current sfOrdersModelObj
class SfOrdersController extends GetxController {
  Rx<SfOrdersModel> sfOrdersModelObj = SfOrdersModel().obs;
}

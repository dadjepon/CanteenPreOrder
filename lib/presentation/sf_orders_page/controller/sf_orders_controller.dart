import 'package:canteenpreorder/core/app_export.dart';
import 'package:canteenpreorder/presentation/sf_orders_page/models/sf_orders_model.dart';

/// A controller class for the SfOrdersPage.
///
/// This class manages the state of the SfOrdersPage, including the
/// current sfOrdersModelObj
class SfOrdersController extends GetxController {
  SfOrdersController(this.sfOrdersModelObj);

  Rx<SfOrdersModel> sfOrdersModelObj;
}

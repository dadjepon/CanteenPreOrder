import 'package:canteenpreorder/core/app_export.dart';
import 'package:canteenpreorder/presentation/sf_order_details_dialog/models/sf_order_details_model.dart';

/// A controller class for the SfOrderDetailsDialog.
///
/// This class manages the state of the SfOrderDetailsDialog, including the
/// current sfOrderDetailsModelObj
class SfOrderDetailsController extends GetxController {
  Rx<SfOrderDetailsModel> sfOrderDetailsModelObj = SfOrderDetailsModel().obs;
}

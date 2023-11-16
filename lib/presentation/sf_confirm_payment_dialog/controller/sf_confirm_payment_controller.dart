import 'package:canteenpreorder/core/app_export.dart';
import 'package:canteenpreorder/presentation/sf_confirm_payment_dialog/models/sf_confirm_payment_model.dart';

/// A controller class for the SfConfirmPaymentDialog.
///
/// This class manages the state of the SfConfirmPaymentDialog, including the
/// current sfConfirmPaymentModelObj
class SfConfirmPaymentController extends GetxController {
  Rx<SfConfirmPaymentModel> sfConfirmPaymentModelObj =
      SfConfirmPaymentModel().obs;
}

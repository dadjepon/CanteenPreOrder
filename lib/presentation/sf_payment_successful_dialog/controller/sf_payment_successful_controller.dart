import 'package:canteenpreorder/core/app_export.dart';
import 'package:canteenpreorder/presentation/sf_payment_successful_dialog/models/sf_payment_successful_model.dart';

/// A controller class for the SfPaymentSuccessfulDialog.
///
/// This class manages the state of the SfPaymentSuccessfulDialog, including the
/// current sfPaymentSuccessfulModelObj
class SfPaymentSuccessfulController extends GetxController {
  Rx<SfPaymentSuccessfulModel> sfPaymentSuccessfulModelObj =
      SfPaymentSuccessfulModel().obs;
}

import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/presentation/sf_delivery_option_dialog/models/sf_delivery_option_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SfDeliveryOptionDialog.
///
/// This class manages the state of the SfDeliveryOptionDialog, including the
/// current sfDeliveryOptionModelObj
class SfDeliveryOptionController extends GetxController {
  TextEditingController kofiJoeController = TextEditingController();

  Rx<SfDeliveryOptionModel> sfDeliveryOptionModelObj =
      SfDeliveryOptionModel().obs;

  @override
  void onClose() {
    super.onClose();
    kofiJoeController.dispose();
  }
}

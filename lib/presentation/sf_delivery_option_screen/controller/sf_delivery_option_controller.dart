import 'package:canteenpreorder/core/app_export.dart';
import 'package:canteenpreorder/presentation/sf_delivery_option_screen/models/sf_delivery_option_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SfDeliveryOptionScreen.
///
/// This class manages the state of the SfDeliveryOptionScreen, including the
/// current sfDeliveryOptionModelObj
class SfDeliveryOptionController extends GetxController {
  TextEditingController kofiCoffeeController = TextEditingController();

  Rx<SfDeliveryOptionModel> sfDeliveryOptionModelObj =
      SfDeliveryOptionModel().obs;

  Rx<String> radioGroup = "".obs;

  Rx<String> radioGroup1 = "".obs;

  @override
  void onClose() {
    super.onClose();
    kofiCoffeeController.dispose();
  }
}

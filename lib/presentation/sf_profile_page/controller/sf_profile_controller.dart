import 'package:canteenpreorder/core/app_export.dart';
import 'package:canteenpreorder/presentation/sf_profile_page/models/sf_profile_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SfProfilePage.
///
/// This class manages the state of the SfProfilePage, including the
/// current sfProfileModelObj
class SfProfileController extends GetxController {
  SfProfileController(this.sfProfileModelObj);

  TextEditingController chevronLeft1Controller = TextEditingController();

  TextEditingController chevronLeft2Controller = TextEditingController();

  TextEditingController chevronLeft3Controller = TextEditingController();

  TextEditingController chevronLeft4Controller = TextEditingController();

  Rx<SfProfileModel> sfProfileModelObj;

  @override
  void onClose() {
    super.onClose();
    chevronLeft1Controller.dispose();
    chevronLeft2Controller.dispose();
    chevronLeft3Controller.dispose();
    chevronLeft4Controller.dispose();
  }
}

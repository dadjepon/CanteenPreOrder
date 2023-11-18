import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/presentation/sf_dashbord_screen/models/sf_dashbord_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SfDashbordScreen.
///
/// This class manages the state of the SfDashbordScreen, including the
/// current sfDashbordModelObj
class SfDashbordController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<SfDashbordModel> sfDashbordModelObj = SfDashbordModel().obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}

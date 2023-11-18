import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/presentation/sf_dashbord_one_container_page/models/sf_dashbord_one_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SfDashbordOneContainerPage.
///
/// This class manages the state of the SfDashbordOneContainerPage, including the
/// current sfDashbordOneContainerModelObj
class SfDashbordOneContainerController extends GetxController {
  SfDashbordOneContainerController(this.sfDashbordOneContainerModelObj);

  TextEditingController searchController = TextEditingController();

  Rx<SfDashbordOneContainerModel> sfDashbordOneContainerModelObj;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}

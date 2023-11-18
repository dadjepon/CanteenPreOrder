import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/presentation/sf_dashbord_one_container1_screen/models/sf_dashbord_one_container1_model.dart';

/// A controller class for the SfDashbordOneContainer1Screen.
///
/// This class manages the state of the SfDashbordOneContainer1Screen, including the
/// current sfDashbordOneContainer1ModelObj
class SfDashbordOneContainer1Controller extends GetxController {
  Rx<SfDashbordOneContainer1Model> sfDashbordOneContainer1ModelObj =
      SfDashbordOneContainer1Model().obs;
}

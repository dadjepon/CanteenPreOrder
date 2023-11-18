import '../controller/sf_dashbord_one_container1_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SfDashbordOneContainer1Screen.
///
/// This class ensures that the SfDashbordOneContainer1Controller is created when the
/// SfDashbordOneContainer1Screen is first loaded.
class SfDashbordOneContainer1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SfDashbordOneContainer1Controller());
  }
}

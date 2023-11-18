import '../controller/sf_dashbord_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SfDashbordScreen.
///
/// This class ensures that the SfDashbordController is created when the
/// SfDashbordScreen is first loaded.
class SfDashbordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SfDashbordController());
  }
}

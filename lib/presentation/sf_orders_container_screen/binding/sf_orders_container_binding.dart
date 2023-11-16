import '../controller/sf_orders_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SfOrdersContainerScreen.
///
/// This class ensures that the SfOrdersContainerController is created when the
/// SfOrdersContainerScreen is first loaded.
class SfOrdersContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SfOrdersContainerController());
  }
}

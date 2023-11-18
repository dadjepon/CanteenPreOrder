import '../controller/sf_orders_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SfOrdersScreen.
///
/// This class ensures that the SfOrdersController is created when the
/// SfOrdersScreen is first loaded.
class SfOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SfOrdersController());
  }
}

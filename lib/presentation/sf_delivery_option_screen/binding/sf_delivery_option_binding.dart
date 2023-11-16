import '../controller/sf_delivery_option_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SfDeliveryOptionScreen.
///
/// This class ensures that the SfDeliveryOptionController is created when the
/// SfDeliveryOptionScreen is first loaded.
class SfDeliveryOptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SfDeliveryOptionController());
  }
}

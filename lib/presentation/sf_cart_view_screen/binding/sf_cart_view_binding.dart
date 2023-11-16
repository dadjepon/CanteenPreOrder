import '../controller/sf_cart_view_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SfCartViewScreen.
///
/// This class ensures that the SfCartViewController is created when the
/// SfCartViewScreen is first loaded.
class SfCartViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SfCartViewController());
  }
}

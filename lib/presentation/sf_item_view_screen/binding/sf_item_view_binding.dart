import '../controller/sf_item_view_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SfItemViewScreen.
///
/// This class ensures that the SfItemViewController is created when the
/// SfItemViewScreen is first loaded.
class SfItemViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SfItemViewController());
  }
}

import '../controller/sf_item_view_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SfItemViewOneScreen.
///
/// This class ensures that the SfItemViewOneController is created when the
/// SfItemViewOneScreen is first loaded.
class SfItemViewOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SfItemViewOneController());
  }
}

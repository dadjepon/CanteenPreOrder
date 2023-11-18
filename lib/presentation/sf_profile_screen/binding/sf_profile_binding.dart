import '../controller/sf_profile_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SfProfileScreen.
///
/// This class ensures that the SfProfileController is created when the
/// SfProfileScreen is first loaded.
class SfProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SfProfileController());
  }
}

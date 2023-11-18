import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/presentation/sf_profile_screen/models/sf_profile_model.dart';

/// A controller class for the SfProfileScreen.
///
/// This class manages the state of the SfProfileScreen, including the
/// current sfProfileModelObj
class SfProfileController extends GetxController {
  Rx<SfProfileModel> sfProfileModelObj = SfProfileModel().obs;
}

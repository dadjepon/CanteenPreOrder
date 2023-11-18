import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/presentation/sf_item_view_screen/models/sf_item_view_model.dart';

/// A controller class for the SfItemViewScreen.
///
/// This class manages the state of the SfItemViewScreen, including the
/// current sfItemViewModelObj
class SfItemViewController extends GetxController {
  Rx<SfItemViewModel> sfItemViewModelObj = SfItemViewModel().obs;
}

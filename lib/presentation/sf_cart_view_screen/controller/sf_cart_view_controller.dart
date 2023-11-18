import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/presentation/sf_cart_view_screen/models/sf_cart_view_model.dart';

/// A controller class for the SfCartViewScreen.
///
/// This class manages the state of the SfCartViewScreen, including the
/// current sfCartViewModelObj
class SfCartViewController extends GetxController {
  Rx<SfCartViewModel> sfCartViewModelObj = SfCartViewModel().obs;
}

import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/presentation/sf_item_view_one_screen/models/sf_item_view_one_model.dart';

/// A controller class for the SfItemViewOneScreen.
///
/// This class manages the state of the SfItemViewOneScreen, including the
/// current sfItemViewOneModelObj
class SfItemViewOneController extends GetxController {
  Rx<SfItemViewOneModel> sfItemViewOneModelObj = SfItemViewOneModel().obs;
}

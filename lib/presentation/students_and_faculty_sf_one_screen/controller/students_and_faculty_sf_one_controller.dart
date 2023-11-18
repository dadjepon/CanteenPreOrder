import 'package:canteenpreorderapp/core/app_export.dart';
import 'package:canteenpreorderapp/presentation/students_and_faculty_sf_one_screen/models/students_and_faculty_sf_one_model.dart';

/// A controller class for the StudentsAndFacultySfOneScreen.
///
/// This class manages the state of the StudentsAndFacultySfOneScreen, including the
/// current studentsAndFacultySfOneModelObj
class StudentsAndFacultySfOneController extends GetxController {
  Rx<StudentsAndFacultySfOneModel> studentsAndFacultySfOneModelObj =
      StudentsAndFacultySfOneModel().obs;
}

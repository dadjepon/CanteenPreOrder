import '../controller/students_and_faculty_sf_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the StudentsAndFacultySfOneScreen.
///
/// This class ensures that the StudentsAndFacultySfOneController is created when the
/// StudentsAndFacultySfOneScreen is first loaded.
class StudentsAndFacultySfOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentsAndFacultySfOneController());
  }
}

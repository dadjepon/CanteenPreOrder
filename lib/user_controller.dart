import 'package:get/get.dart';

class UserController extends GetxController {
  var isSignedIn = false.obs;

  void updateSignInStatus(bool status) {
    isSignedIn.value = status;
  }
}

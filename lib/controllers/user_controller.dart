import 'package:get/get.dart';
import 'package:hci_03/models/user.dart';

class UserController extends GetxController {
  var user = User(
    memberId: '',
    password: '',
    name: '',
    deviceKey: '',
  ).obs;

  void setUser(User newUser) {
    user.value = newUser;
  }
}

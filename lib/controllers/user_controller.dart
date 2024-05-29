import 'package:get/get.dart';
import 'package:hci_03/models/user.dart';

// NOTE: 현재 접속한 유저의 정보를 가져오기 위한 클래스입니다.
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

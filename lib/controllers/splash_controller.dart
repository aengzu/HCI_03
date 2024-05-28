import 'package:get/get.dart';
import 'package:hci_03/screens/auth/login_screen.dart';
import 'package:hci_03/screens/main_screens.dart';
import 'package:hci_03/controllers/user_controller.dart';

import 'battle_controller.dart';

// NOTE : 스플래시 화면 컨트롤러입니다. 만약 로그인이 되어있다면 메인스크린으로 이동하고
// 로그인이 되어 있지 않으면 로그인 스크린으로 이동합니다.
class SplashController extends GetxController {
  BattleController battleController = Get.put(BattleController());
  final UserController userController = Get.find<UserController>();
  @override
  void onInit() {
    super.onInit();
    // 초기화 시 바로 배틀 fetch 해온다. - 만약 배틀 상대가 있다면 초기 메인화면 달라짐
    battleController.fetchBattle(userController.user.value.memberId);
    Future.delayed(Duration(seconds: 3), _loadNextScreen);
  }

  void _loadNextScreen() {
    // 로그인 상태에 따라 다른 화면으로 이동
    if (Get.find<UserController>().user.value.memberId.isNotEmpty) {
      Get.offAll(() => MainScreens());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }
}

import 'package:get/get.dart';
import 'package:hci_03/screens/main_screens.dart';

// NOTE : 스플래시 스크린에 대한 스켈레톤 코드입니다. 로그인 상태를 판별하지만 일단 서버 미구현으로 주석 처리하였습니다.
class SplashController extends GetxController {
  // 앱 시작 시 필요한 데이터 로딩 등의 초기화 작업을 수행합니다.
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3), _loadNextScreen);
  }

  void _loadNextScreen() {
    // 로그인 상태에 따라 다른 화면으로 이동, 일단은 회원가입 구현 안되므로 주석처리
    // if (Get.find<AppController>().isLoggedIn) {
    //   Get.offAll(() => MainScreens());
    // } else {
    //   Get.offAll(() => LoginScreen());
    // }
    Get.offAll(()=> MainScreens());
  }
}

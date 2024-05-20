import 'package:get/get.dart';
import 'package:hci_03/screens/main_screens.dart';
import 'package:hci_03/service/auth_service.dart';

// NOTE : 회원가입 컨트롤러 스켈레톤 코드입니다.
class SignUpController extends GetxController {
  final AuthService _authService = AuthService();
  RxString token = ''.obs;


  Future<void> signUp(String username, String email, String password) async {
    try {
      token.value = await _authService.register(username, email, password);
      if (token.isNotEmpty) {
        Get.offAll(() => MainScreens());  // 회원가입 후 메인 페이지로 리다이렉션
      }
    } catch (e) {
      Get.snackbar("Sign Up Failed", e.toString());
    }
  }
}

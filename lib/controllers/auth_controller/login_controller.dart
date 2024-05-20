
import 'package:get/get.dart';
import 'package:hci_03/service/auth_service.dart';


// NOTE : 로그인 컨트롤러 스켈레톤 코드입니다.
class LoginController extends GetxController {
  final AuthService _authService = AuthService();
  RxString token = ''.obs;

  Future<void> login(String username, String password) async {
    try {
      token.value = await _authService.login(username, password);
    } catch (e) {
      Get.snackbar("Login Failed", e.toString());
    }
  }
}

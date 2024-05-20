import 'package:get/get.dart';
import 'package:hci_03/service/auth_service.dart';

// NOTE : 전체 어플 시작을 관리하는 컨트롤러 입니다. 로그인 여부에 따라 표시되는 화면이 다르게됩니다.
class AppController extends GetxController{
  final AuthService _authService = AuthService();
  final RxBool _isLoggedIn = false.obs;

  @override
  void onInit() {
    _isLoggedIn.value = _authService.isLoggedIn();
    super.onInit();
  }
  bool get isLoggedIn => _isLoggedIn.value;
}
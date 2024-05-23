import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hci_03/screens/main_screens.dart';
import 'package:http/http.dart' as http;
import 'package:hci_03/constants/app_url.dart';
import 'package:hci_03/models/user.dart';
import 'package:hci_03/controllers/user_controller.dart';

class LoginController extends GetxController {
  final String _apiUrl;

  LoginController() : _apiUrl = "${AppUrl.baseUrl}/api/member/login";

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  TextEditingController memberIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login(String memberId, String password) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'memberId': memberId,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // 로그인 성공
        var userJson = jsonDecode(response.body);
        User user = User.fromJson(userJson);
        Get.find<UserController>().setUser(user);
        Get.to(() => MainScreens());
      } else {
        errorMessage.value = 'Failed to login: ${response.statusCode}';
        Get.snackbar('Error', errorMessage.value, snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      errorMessage.value = 'Failed to login: $e';
      Get.snackbar('Error', errorMessage.value, snackPosition: SnackPosition.TOP);
    } finally {
      isLoading.value = false;
    }
  }
}

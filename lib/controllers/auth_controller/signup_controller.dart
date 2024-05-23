import 'dart:convert';
import 'package:hci_03/models/user.dart';
import 'package:hci_03/screens/main_screens.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:hci_03/constants/app_url.dart';

class SignUpController extends GetxController {
  final String baseUrl = AppUrl.baseUrl;
  final String _apiUrl;

  SignUpController() : _apiUrl = "${AppUrl.baseUrl}/api/member/register";

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var isDeviceKeyLoaded = false.obs;

  TextEditingController memberIdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String deviceKey = '';

  @override
  void onInit() {
    super.onInit();
    _getDeviceKey();
  }

  Future<void> _getDeviceKey() async {
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (GetPlatform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceKey = androidInfo.id!;
      } else if (GetPlatform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceKey = iosInfo.identifierForVendor!;
      }
    } catch (e) {
      errorMessage.value = 'Failed to get device key: $e';
    } finally {
      isDeviceKeyLoaded.value = true;
    }
  }

  Future<void> signUp(String memberId, String name, String password) async {
    User user = User(
      deviceKey: deviceKey,
      memberId: memberId,
      name: name,
      password: password,
    );

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Signup successful
        Get.to(MainScreens());

      } else {
        errorMessage.value = 'Failed to sign up: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Failed to sign up: $e';
    } finally {
      isLoading.value = false;
    }
  }
}

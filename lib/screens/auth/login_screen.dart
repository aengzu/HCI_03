import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/controllers/auth_controller/login_controller.dart';
import 'package:hci_03/screens/auth/signup_screen.dart';
import 'package:hci_03/screens/components/custom_btn.dart';
import 'package:sizing/sizing.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('로그인', style: textTheme().titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() {
          return ListView(
            children: [
              _buildTextField(
                controller: loginController.memberIdController,
                labelText: '사용자 ID',
                hintText: '사용자 ID를 입력하세요.',
              ),
              SizedBox(height: 0.03.sh),
              _buildTextField(
                controller: loginController.passwordController,
                labelText: '비밀번호',
                hintText: '비밀번호를 입력하세요.',
                isObscure: true,
              ),
              SizedBox(height: 0.2.sh),
              CustomButton(
                label: loginController.isLoading.value ? '로그인 중...' : '로그인하기',
                onPressed: loginController.isLoading.value
                    ? null
                    : () {
                  loginController.login(
                    loginController.memberIdController.text,
                    loginController.passwordController.text,
                  );
                },
              ),
              SizedBox(height: 0.01.sh),
              TextButton(
                onPressed: () {
                  Get.to(() => SignUpScreen());
                },
                child: const Text(
                  '회원 가입하기',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    bool isObscure = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: textTheme().titleSmall,
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isObscure,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: textTheme().bodyMedium,
            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

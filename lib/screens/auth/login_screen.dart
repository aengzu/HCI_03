import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/controllers/auth_controller/login_controller.dart';
import 'package:hci_03/screens/auth/signup_screen.dart';
import 'package:hci_03/screens/components/custom_btn.dart';
import 'package:hci_03/screens/main_screens.dart';
import 'package:sizing/sizing.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('로그인', style: textTheme().titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // 추가한 전체 Padding
        child: Column(
          children: [
            SizedBox(height: 50,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintStyle: textTheme().bodyMedium,
                hintText: '이름을 입력하세요.',
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // 추가한 필드별 Padding
                border: OutlineInputBorder( // 추가한 테두리 스타일
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'password를 입력하세요.',
                hintStyle: textTheme().bodyMedium,
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // 추가한 필드별 Padding
                border: OutlineInputBorder( // 추가한 테두리 스타일
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 0.06.sh), // 버튼과의 간격
            CustomButton(label: '로그인하기', onPressed: () async {
              await loginController.login(emailController.text, passwordController.text);
              if (loginController.token.isNotEmpty) {
                Get.to(() => MainScreens());
              }
            },
            ),
            SizedBox(height: 0.01.sh,),
            TextButton(
              onPressed: () {Get.to(()=>SignUpScreen());},
              child: const Text(
                '회원 가입하기',
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

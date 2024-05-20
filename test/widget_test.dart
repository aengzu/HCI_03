import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hci_03/controllers/auth_controller/signup_controller.dart';
import 'package:hci_03/screens/components/custom_btn.dart';



class SignUpScreen extends StatelessWidget {
  final SignUpController signUpController = Get.put(SignUpController());



  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("회원가입")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            _buildTextField(
              controller: usernameController,
              labelText: '사용자 이름',
              hintText: '사용자 이름을 입력하세요.',
            ),
            SizedBox(height: 20),
            _buildTextField(
              controller: emailController,
              labelText: '이메일',
              hintText: '이메일을 입력하세요.',
            ),
            SizedBox(height: 20),
            _buildTextField(
              controller: passwordController,
              labelText: '비밀번호',
              hintText: '비밀번호를 입력하세요.',
              isObscure: true,
            ),

            SizedBox(height: 40),
            CustomButton(
              label: '회원가입하기',
              onPressed: () async {
                await signUpController.signUp(
                    usernameController.text,
                    emailController.text,
                    passwordController.text
                );
              },
            ),
          ],
        ),
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
      crossAxisAlignment: CrossAxisAlignment.start, // 라벨과 텍스트 필드를 왼쪽 정렬합니다.
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16, // 적절한 폰트 사이즈로 조정
            fontWeight: FontWeight.bold, // 라벨에 볼드 스타일 적용
            color: Colors.black54, // 라벨 색상 조정
          ),
        ),
        SizedBox(height: 8), // 라벨과 텍스트 필드 사이의 간격 조정
        TextField(
          controller: controller,
          obscureText: isObscure,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(
                vertical: 10.0, horizontal: 10.0),
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
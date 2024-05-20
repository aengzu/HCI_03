import 'package:hci_03/constants/app_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class AuthService {
  String? _token;

  // 서버 주소 가져옴 TODO: 서버 구현 되면 해당 baseUrl 로 수정할 것.
  get baseUrl => AppUrl.baseUrl;

  Future<String> login(String username, String password) async {
    // login url 로 요청 보내기
    final response = await http.post(
      // TODO: 로그인 요청보내는 Url 로 수정하기
        Uri.parse('${baseUrl}/auth/token'),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {
          'username': Uri.encodeComponent(username),
          'password': Uri.encodeComponent(password)
        }
    );

    if (response.statusCode == 200) {
      // 정상적으로 로그인 시
      var decodedBody = utf8.decode(response.bodyBytes);
      _token = jsonDecode(decodedBody)['access_token'];
      return _token!;
    } else {
      // 에러 발생시
      throw Exception('Failed to login with status code: ${response.statusCode}');
    }
  }

  // 회원 가입
  // TODO : 회원가입 및 로그인에 사용될 USER 모델 구현하기
  Future<String> register(String username, String email, String password) async {
    final response = await http.post(
      // TODO: 회원가입 요청보내는 Url 로 수정하기
        Uri.parse('$baseUrl/auth/'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "username": username,
          "email": email,
          "password": password
        })
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body)['access_token'];
    } else {
      throw Exception('Failed to register with status code: ${response.statusCode}, body: ${response.body}');
    }
  }

  // 마이페이지에서 내 정보 조회
  Future<Map<String, dynamic>> getUserInfo(String token) async {
    final response = await http.get(
      // TODO: 내정보 get하는 Url 로 수정하기
        Uri.parse('$baseUrl/users/me'),
        headers: {'Authorization': 'Bearer $token'}
    );

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to fetch user info: Status code ${response.statusCode}, body: ${response.body}');
    }
  }
 // 토큰의 여부로 로그인 여부 판별합니다.
  bool isLoggedIn() => _token != null;
}

import 'package:hci_03/constants/app_url.dart';
import 'package:hci_03/models/notification.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// NOTE: 알림과 관련되어 서버와 소통하는 클래스입니다.
// TODO : 현재 기능 구현 필요
class NotificationService {
  final String baseUrl = AppUrl.baseUrl;

  Future<List<Notification>> getNotifications(String memberId) async {
    final response = await http.get(Uri.parse('$baseUrl/api/notification/$memberId'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(utf8.decode(response.bodyBytes)); // 한글 인코딩 문제 해결
      return body.map((dynamic item) => Notification.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  Future<void> sendNotification(String memberId, String message) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/notification/send'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'memberId': memberId,
        'message': message,
        'timestamp': DateTime.now().toIso8601String(),
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to send notification');
    }
  }
}

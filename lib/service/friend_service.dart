import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hci_03/constants/app_url.dart';
import 'package:hci_03/models/friend.dart';
import 'package:hci_03/models/friend_dto.dart';

// NOTE: 서버의 API 에 직접적으로 소통하는 부분입니다.
class FriendService {
  // baseUrl 가져오기
  final String baseUrl = AppUrl.baseUrl;

  // 친구 등록 메서드
  Future<void> registerFriend(FriendDto friendDto) async {
    final response = await http.post(
      // 친구 등록 API 에 요청 보냄
      Uri.parse('$baseUrl/api/friend/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(friendDto.toJson()),
      encoding: Encoding.getByName('utf-8'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to register friend');
    }
  }
 // 친구 목록 get 메서드
  Future<List<FriendResponse>> getFriends(String memberId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/$memberId/friends'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      return body.map((dynamic item) => FriendResponse.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load friends');
    }
  }
}

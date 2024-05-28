// services/battle_service.dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:hci_03/constants/app_url.dart';
import 'package:hci_03/models/battle_dto.dart';
import 'package:hci_03/models/battle.dart';
import 'package:hci_03/models/battletask_dto.dart';
import '../models/task_dto.dart';

class BattleService {
  final String baseUrl = AppUrl.baseUrl;

  // 배틀 정보 가져오기
  Future<Battle> getBattle(String memberId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/battle/$memberId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var utf8Body = utf8.decode(response.bodyBytes);
      var jsonData = jsonDecode(utf8Body);
      // JSON 데이터를 보기 좋게 출력
      print(JsonEncoder.withIndent('  ').convert(jsonData));
      return Battle.fromJson(jsonData);
    } else {
      throw Exception('Failed to load battle');
    }
  }

  // 배틀 태스크 체크
  Future<void> checkTask(BattleTaskDto taskDto) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/battle/task'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(taskDto.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to check task');
    }
  }

  // 이미지 업로드와 함께 태스크 체크
  Future<void> uploadTaskImage(TaskDto taskDto, File imageFile) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/api/battle/task'),
    );

    // 파일 추가
    request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    // JSON 파라미터 추가
    request.fields['battleNo'] = taskDto.battleNo.toString();
    request.fields['memberNo'] = taskDto.memberNo;
    request.fields['taskNo'] = taskDto.taskNo;

    var response = await request.send();

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to upload image and check task');
    }
  }

  // 배틀 신청
  Future<void> registerBattle(BattleDto battleDto) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/battle/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(battleDto.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 500) {
      print('Battle registration successful: ${battleDto.toJson()}');
    } else {
      var utf8Body = utf8.decode(response.bodyBytes);
      print(JsonEncoder.withIndent('  ').convert(jsonDecode(utf8Body)));
      print('Failed to register battle: $utf8Body');
      print(response.statusCode);
      throw Exception('Failed to register battle');
    }
  }

  // 배틀 수락하기
  Future<void> acceptBattle(BattleTaskDto battleTaskDto) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/battle/accept'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(battleTaskDto.toJson()),
    );

    if (response.statusCode == 200) {
      var utf8Body = utf8.decode(response.bodyBytes);
      print('Battle accepted successfully: ${JsonEncoder.withIndent('  ').convert(jsonDecode(utf8Body))}');
    } else {
      var utf8Body = utf8.decode(response.bodyBytes);
      print('Failed to accept battle: ${JsonEncoder.withIndent('  ').convert(jsonDecode(utf8Body))}');
      throw Exception('Failed to accept battle');
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hci_03/constants/app_url.dart';
import 'package:hci_03/models/battle_dto.dart';

import '../models/battle.dart';
import '../models/battletask_dto.dart';

// NOTE: 대결 상황 및 신청, 수락을 직접적으로 서버와 소통하는 부분입니다.
class BattleService {
  final String baseUrl = AppUrl.baseUrl;

  // 배틀 신청
  Future<void> registerBattle(BattleDto battleDto) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/battle/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(battleDto.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to register battle');
    }
  }

  // 배틀 정보 가져오기
  Future<Battle> getBattle(String memberId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/battle/$memberId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Battle.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load battle');
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

    if (response.statusCode != 200) {
      throw Exception('Failed to accept battle');
    }
  }
}

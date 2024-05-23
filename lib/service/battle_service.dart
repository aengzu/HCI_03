import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hci_03/constants/app_url.dart';
import 'package:hci_03/models/battle_dto.dart';

import '../models/battle.dart';
import '../models/battletask_dto.dart';

class BattleService {
  final String baseUrl = AppUrl.baseUrl;

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

// models/battle.dart
import 'battletask.dart';

class Battle {
  final int battleNo;
  final String challenger;
  final String challengee;
  final String createAt;
  final String status;
  final String? reward;
  final bool accept;
  final List<BattleTask> battleTasks;

  Battle({
    required this.battleNo,
    required this.challenger,
    required this.challengee,
    required this.createAt,
    required this.status,
    this.reward,
    required this.accept,
    required this.battleTasks,
  });

  factory Battle.fromJson(Map<String, dynamic> json) {
    var battleTasksJson = json['battleTasks'] as List;
    List<BattleTask> battleTasksList = battleTasksJson.map((i) => BattleTask.fromJson(i)).toList();

    return Battle(
      battleNo: json['battleNo'],
      challenger: json['challenger'],
      challengee: json['challengee'],
      createAt: json['createAt'],
      status: json['status'],
      reward: json['reward'],
      accept: json['accept'],
      battleTasks: battleTasksList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'battleNo': battleNo,
      'challenger': challenger,
      'challengee': challengee,
      'createAt': createAt,
      'status': status,
      'reward': reward,
      'accept': accept,
      'battleTasks': battleTasks.map((v) => v?.toJson()).toList(),
    };
  }
}
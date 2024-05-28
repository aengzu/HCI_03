
import 'package:hci_03/models/task.dart';

class BattleTask {
  final int battleTaskNo;
  final String? image;
  final Task task;
  final String memberNo;
  final bool check;
  final bool auth;

  BattleTask({
    required this.battleTaskNo,
    this.image,
    required this.task,
    required this.memberNo,
    required this.check,
    required this.auth,
  });

  factory BattleTask.fromJson(Map<String, dynamic> json) {
    return BattleTask(
      battleTaskNo: json['battleTaskNo'],
      image: json['image'],
      task: Task.fromJson(json['task']),
      memberNo: json['memberNo'],
      check: json['check'],
      auth: json['auth'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'battleTaskNo': battleTaskNo,
      'image': image,
      'task': task.toJson(),
      'memberNo': memberNo,
      'check': check,
      'auth': auth,
    };
  }
}

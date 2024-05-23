class BattleTaskDto {
  final int battleNo;
  final String challengeeId;
  final String challengerId;
  final String tasks;

  BattleTaskDto({
    required this.battleNo,
    required this.challengeeId,
    required this.challengerId,
    required this.tasks,
  });

  Map<String, dynamic> toJson() {
    return {
      'battleNo': battleNo,
      'challengeeId': challengeeId,
      'challengerId': challengerId,
      'tasks': tasks,
    };
  }

  factory BattleTaskDto.fromJson(Map<String, dynamic> json) {
    return BattleTaskDto(
      battleNo: json['battleNo'],
      challengeeId: json['challengeeId'],
      challengerId: json['challengerId'],
      tasks: json['tasks'],
    );
  }
}

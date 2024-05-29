class BattleDto {
  final String challengeeId;
  final String challengerId;
  final String tasks;

  BattleDto({required this.challengeeId, required this.challengerId, required this.tasks});

  Map<String, dynamic> toJson() {
    return {
      'challengeeId': challengeeId,
      'challengerId': challengerId,
      'tasks': tasks,
    };
  }
}

class TaskDto {
  final int battleNo;
  final String memberNo;
  final String taskNo;

  TaskDto({
    required this.battleNo,
    required this.memberNo,
    required this.taskNo,
  });

  Map<String, dynamic> toJson() {
    return {
      'battleNo': battleNo,
      'memberNo': memberNo,
      'taskNo': taskNo,
    };
  }
}

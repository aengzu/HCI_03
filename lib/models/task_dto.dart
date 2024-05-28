// models/task_dto.dart
class TaskDto {
  final int battleNo;
  final String memberNo;
  final String taskNo;

  TaskDto({
    required this.battleNo,
    required this.memberNo,
    required this.taskNo,
  });

  factory TaskDto.fromJson(Map<String, dynamic> json) {
    return TaskDto(
      battleNo: json['battleNo'],
      memberNo: json['memberNo'],
      taskNo: json['taskNo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'battleNo': battleNo,
      'memberNo': memberNo,
      'taskNo': taskNo,
    };
  }
}

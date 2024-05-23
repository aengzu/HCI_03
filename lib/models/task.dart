class Task {
  final String taskName;
  final int taskNo;
  bool isChecked;

  Task({required this.taskName, required this.taskNo, this.isChecked = false});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      taskName: json['taskName'],
      taskNo: json['taskNo'],
      isChecked: json['isChecked'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'taskName': taskName,
      'taskNo': taskNo,
      'isChecked': isChecked,
    };
  }
}

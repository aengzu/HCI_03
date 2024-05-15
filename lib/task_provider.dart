import 'package:flutter/material.dart';
import 'package:hci_03/models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = []; // 최종 메인 화면에 띄우게 될 태스크 현재는 더미

  List<Task> get tasks => _tasks;

  void toggleTaskCheck(Task task) {
    task.toggleCheck();
    notifyListeners();
  }


  void setTasks(List<Task> tasks) {
    _tasks = tasks;
    notifyListeners();
  }

  void saveSelectedTasks() {
    List<Task> selectedTasks = _tasks.where((task) => task.isChecked).toList();
    // 실제 저장 로직을 여기에 추가합니다.
    // 현재는 더미 데이터로 로그를 출력합니다.
    print('Saving selected tasks:');
    selectedTasks.forEach((task) => print('${task.title}: ${task.isChecked}'));
  }
}

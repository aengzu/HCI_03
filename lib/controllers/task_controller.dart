import 'package:flutter/material.dart';
import 'package:hci_03/models/task.dart';

class TaskController with ChangeNotifier {
  // Dummy tasks for demonstration purposes
  List<Task> defualtTasks = [
    Task(title: "비타민 먹기", emoji: "💊"),
    Task(title: "아침 식사하기", emoji: "🍳"),
    Task(title: "선크림 바르기", emoji: "🌞"),
    Task(title: "도서관 가기", emoji: "📚"),
    Task(title: "러닝 30분 하기", emoji: "🏃"),
    Task(title: "체육관 가기", emoji: "🏋️"),
    Task(title: "러닝 20분 하기", emoji: "🏃"),
  ];

  List<Task> bothSelectedTasks = [
    Task(title: "비타민 먹기", emoji: "💊", isChecked: true),
    Task(title: "아침 식사하기", emoji: "🍳", isChecked: true),
    Task(title: "선크림 바르기", emoji: "🌞", isChecked: true),
    Task(title: "아침 식사하기", emoji: "🍳", isChecked: true),
    Task(title: "선크림 바르기", emoji: "🌞", isChecked: true),
  ];

  List<Task> opponentSelectedTasks = [
    Task(title: "도서관 가기", emoji: "📚"),
    Task(title: "러닝 30분 하기", emoji: "🏃"),
    Task(title: "도서관 가기", emoji: "📚"),
    Task(title: "러닝 30분 하기", emoji: "🏃"),
    Task(title: "도서관 가기", emoji: "📚"),
    Task(title: "러닝 30분 하기", emoji: "🏃"),
  ];

  List<Task> getBothSelectedTasks() {
    return bothSelectedTasks;
  }

  List<Task> getOpponentSelectedTasks() {
    return opponentSelectedTasks;
  }

  void toggleTask(Task task) {
    // task 의 체크 여부를 변경하게 됨.
    task.isChecked = !task.isChecked;
    notifyListeners();
  }

  void addTask(String title, String emoji) {
    if (title.isNotEmpty) { // addTask 를 하면 defalutTask 더미데이터에 일단 추가됩니다.
      defualtTasks.add(Task(title: title, emoji: emoji));
      notifyListeners();
    }
  }

  void saveTasks() {
    List<Task> selectedTasks = [
      ...bothSelectedTasks.where((task) => task.isChecked),
      ...opponentSelectedTasks.where((task) => task.isChecked),
    ];
    // 테스트를 위해 출력
    selectedTasks.forEach((task) => print('Selected Task: ${task.title}'));
  }
}

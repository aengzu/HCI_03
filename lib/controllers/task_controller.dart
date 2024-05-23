import 'package:flutter/material.dart';
import 'package:hci_03/models/task.dart';

import 'package:hci_03/models/task.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  var defualtTasks = <Task>[
    Task(title: "비타민 먹기", emoji: "💊"),
    Task(title: "아침 식사하기", emoji: "🍳"),
    Task(title: "선크림 바르기", emoji: "🌞"),
    Task(title: "도서관 가기", emoji: "📚"),
    Task(title: "러닝 30분 하기", emoji: "🏃"),
    Task(title: "체육관 가기", emoji: "🏋️"),
    Task(title: "러닝 20분 하기", emoji: "🏃"),
  ].obs;

  // 선택된 태스크 목록을 반환하는 메서드
  List<Task> getSelectedTasks() {
    return defualtTasks.where((task) => task.isChecked).toList();
  }

  // 태스크 추가 메서드
  void addTask(String title, String emoji) {
    defualtTasks.add(Task(title: title, emoji: emoji, isChecked: false));
  }

  // 태스크 토글 메서드
  void toggleTask(Task task) {
    task.isChecked = !task.isChecked;
    defualtTasks.refresh();
  }
}

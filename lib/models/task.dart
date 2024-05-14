import 'package:flutter/material.dart';

class Task {
  final String title;
  final bool isChecked;
  final String emoji;

  Task({
    required this.title,
    required this.isChecked,
    required this.emoji,
  });
}

  final List<Task> dummyTasks = [
    Task(title: '비타민 먹기', isChecked: false, emoji: '💊'),
    Task(title: '아침 식사하기', isChecked: true, emoji: '🔍'),
    Task(title: '선크림 바르기', isChecked: true, emoji: '🌞'),
    Task(title: '이불 정리하기', isChecked: true, emoji: '🛏️'),
    Task(title: '이불 정리하기', isChecked: true, emoji: '🛏️'),
  ];

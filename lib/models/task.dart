import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Task extends ChangeNotifier {
  // 태스크 모델입니다.
  String title;
  String emoji;
  bool isChecked;

  Task({
    required this.title,
    required this.emoji,
    this.isChecked = false,
  });

  void toggleCheck() {
    isChecked = !isChecked;
    notifyListeners();
  }
}

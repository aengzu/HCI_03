import 'package:hci_03/models/task.dart';
import '../task_provider.dart';

class TaskController {
  // 더미 태스크 관리하는 컨트롤러인데 서버 구현하게 된다면 이 부분 수정하면 됩니다.
  List<Task> defualtTasks = [
    Task(title: "비타민 먹기", emoji: "💊", isChecked: true),
    Task(title: "아침 식사하기", emoji: "🍳", isChecked: true),
    Task(title: "선크림 바르기", emoji: "🌞", isChecked: true),
    Task(title: "도서관 가기", emoji: "📚"),
    Task(title: "러닝 30분 하기", emoji: "🏃"),
    Task(title: "체육관 가기", emoji: "📚"),
    Task(title: "러닝 20분 하기", emoji: "🏃"),
  ];

  List<Task> bothSelectedTasks = [
    Task(title: "비타민 먹기", emoji: "💊", isChecked: true),
    Task(title: "아침 식사하기", emoji: "🍳", isChecked: true),
    Task(title: "선크림 바르기", emoji: "🌞", isChecked: true),
  ];

  List<Task> opponentSelectedTasks = [
    Task(title: "도서관 가기", emoji: "📚"),
    Task(title: "러닝 30분 하기", emoji: "🏃"),
  ];

  List<Task> getBothSelectedTasks() {
    return bothSelectedTasks;
  }

  List<Task> getOpponentSelectedTasks() {
    return opponentSelectedTasks;
  }

  void toggleTaskCheck(Task task) {
    task.toggleCheck();
  }

  void saveTasks(TaskProvider taskProvider) {
    List<Task> selectedTasks = [];
    selectedTasks.addAll(bothSelectedTasks.where((task) => task.isChecked).toList());
    selectedTasks.addAll(opponentSelectedTasks.where((task) => task.isChecked).toList());
    taskProvider.setTasks(selectedTasks);
  }
}

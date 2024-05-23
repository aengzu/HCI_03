import 'package:get/get.dart';
import 'package:hci_03/models/task.dart';
import 'package:hci_03/service/task_service.dart';

// NOTE: 디폴트 태스크를 가져오고 등록하기 위한 컨트롤러입니다.
// TODO: challenger가 고른 태스크, challengee 가 고른 태스크, 둘 다 고른 태스크를 위한 처리가 필요합니다.
class TaskController extends GetxController {
  var isLoading = false.obs;
  var tasks = <Task>[].obs;
  var errorMessage = ''.obs;

  final TaskService taskService = TaskService();

  @override
  void onInit() {
    super.onInit();
    fetchAllTasks(); // 초기화 시 모든 디폴트 태스크를 서버에서 가져옴
  }

  // 모든 태스크 가져오기
  Future<void> fetchAllTasks() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      tasks.value = await taskService.getAllTasks();
    } catch (e) {
      errorMessage.value = 'Failed to load tasks: $e';
    } finally {
      isLoading.value = false;
    }
  }

  // 태스크를 등록하기
  Future<void> registerTask(String title) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      await taskService.registerTask(title);
      await fetchAllTasks(); // 새로 태스크를 등록한 후 태스크 목록을 새로고침
    } catch (e) {
      errorMessage.value = 'Failed to register task: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> searchTasks(String taskName) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      tasks.value = await taskService.getTasksByName(taskName);
    } catch (e) {
      errorMessage.value = 'Failed to search tasks: $e';
    } finally {
      isLoading.value = false;
    }
  }

  // 태스크 체크 표시
  void toggleTask(Task task) {
    task.isChecked = !task.isChecked;
    tasks.refresh(); // UI 갱신을 위해 옵저버블 리스트를 새로 고침
  }

  // 선택된 태스크 가져오기
  List<Task> getSelectedTasks() {
    return tasks.where((task) => task.isChecked).toList();
  }
}

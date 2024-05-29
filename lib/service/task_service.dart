import 'dart:convert';
import 'package:hci_03/constants/app_url.dart';
import 'package:hci_03/models/task.dart';
import 'package:http/http.dart' as http;

class TaskService {
  final String baseUrl = AppUrl.baseUrl;

  Future<List<Task>> getAllTasks() async {
    final response = await http.get(Uri.parse('$baseUrl/api/Alltasks'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(utf8.decode(response.bodyBytes));
      return body.map((dynamic item) => Task.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  Future<void> registerTask(String title) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/task/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to register task');
    }
  }

  Future<List<Task>> getTasksByName(String taskName) async {
    final response = await http.get(Uri.parse('$baseUrl/api/tasks?task=$taskName'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(utf8.decode(response.bodyBytes));
      return body.map((dynamic item) => Task.fromJson(item)).toList();
    } else {
      throw Exception('Failed to search tasks');
    }
  }

  Future<List<Task>> getTasksByNumbers(List<int> taskNumbers) async {
    String taskQuery = taskNumbers.join(',');
    final response = await http.get(Uri.parse('$baseUrl/api/tasks?task=$taskQuery'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(utf8.decode(response.bodyBytes));
      return body.map((dynamic item) => Task.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load tasks by number');
    }
  }
}

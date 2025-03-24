import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bai2/model/task_model.dart';

class ApiService {
  static Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse('https://amock.io/api/researchUTH/tasks'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);

      // Lấy danh sách công việc từ key "data"
      List<dynamic> tasksJson = jsonData['data'];

      // Chuyển đổi từng công việc thành Task object
      return tasksJson.map((task) => Task.fromJson(task)).toList();
    } else {
      throw Exception('Lỗi khi tải danh sách công việc');
    }
  }
}

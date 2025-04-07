import 'package:flutter/material.dart';

class Homework {
  final String task;
  final String description;

  Homework({
    required this.task,
    required this.description,
  });
}

class HomeworkProvider extends ChangeNotifier {        //  Lớp HomeworkProvider cần kế thừa từ ChangeNotifier.
  final List<Homework> _homeworks = [
    Homework(
      task: "Complete Android Project",
      description: "Finish the UI, integrate API, and write documentation",
    ),
    Homework(
      task: "Complete Android Project",
      description: "Finish the UI, integrate API, and write documentation",
    ),
    Homework(
      task: "Complete Android Project",
      description: "Finish the UI, integrate API, and write documentation",
    ),
  ];                     // Danh sách để lưu trữ dữ liệu.

  List<Homework> get homeworks => _homeworks;       // Đây là cách để truy cập danh sách từ bên ngoài (không phép chỉnh sửa trực tiếp)

  void addHomework(Homework newHomework) {
    _homeworks.add(newHomework);
    notifyListeners();     // thông báo cho UI biết khi dữ liệu thay đổi,
  }
}
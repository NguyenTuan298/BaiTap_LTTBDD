import 'package:arch/screens/homework.dart';
import 'package:arch/screens/homework_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(     // ChangeNotifierProvider: Một phần của thư viện Provider ( cung cấp một ChangeNotifier (lớp có thể thông báo khi dữ liệu thay đổi))
    create: (context) => HomeworkProvider(),    //Hàm create được dùng để tạo một instance của HomeworkProvider. Provider sẽ quản lý vòng đời của đối tượng này.
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home_Work(),
    ),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}

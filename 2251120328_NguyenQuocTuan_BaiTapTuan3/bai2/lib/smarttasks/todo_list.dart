import 'package:flutter/material.dart';
import 'package:bai2/model/task_model.dart';
import 'package:bai2/services/api_services.dart';
import 'package:bai2/smarttasks/list_empty.dart';
import 'package:bai2/smarttasks/detail_s2.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  late Future<List<Task>> futureTasks;

  @override
  void  initState(){
    super.initState();
    futureTasks = ApiService.fetchTasks();

    futureTasks.then((tasks) {
      print("Dữ liệu nhận được: $tasks"); // Kiểm tra dữ liệu API
    }).catchError((error) {
      print("Lỗi khi fetch dữ liệu: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        // THANH APPBAR
        children: <Widget>[
          SizedBox(height: 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 18,),
              Image.asset(
                  'assets/Image/UTH_todolist.png',
                  width: 90,
                  height: 90,
              ),

              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SmartTasks',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),

                  Text(
                    'A simple and efficient to-do app',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.blue,
                      // fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 100,
                child: IconButton(
                    onPressed: (){},
                    icon: Image.asset('assets/Image/Notification.png'),
                ),
              )
            ]
          ),


          // DANH SÁCH NHIỆM VỤ API
          Expanded(
            child: FutureBuilder<List<Task>>(
              future: futureTasks,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, color: Colors.red, size: 40),
                        SizedBox(height: 10),
                        Text("Lỗi khi tải dữ liệu",
                            style: TextStyle(color: Colors.red, fontSize: 18)),
                        Text(snapshot.error.toString(),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  );
                } else {
                  List<Task> tasks = snapshot.data ?? [];
                  if (tasks.isEmpty) {
                    return Center(child: Text("Không có nhiệm vụ nào."));
                  }

                  // Danh sách màu cố định
                  final List<Color> taskColors = [
                    Color(0xFFF48FB1), // màu hồng
                    Color(0xFFC5E1A5), // màu xanh lá
                    Color(0xFF4FC3F7), // màu xanh dương
                  ];


                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      // class Task có đối tượng là task
                      Task task = tasks[index];

                      Color bgColor = taskColors[index % taskColors.length];

                      // Thiết kế UI cho mỗi nhiệm vụ
                      // InkWell ( or GestureDetector ): để tạo hiệu ứng nhấn cho toàn bộ widget bên trong
                      return InkWell(
                        onTap: () {
                          if (tasks.isEmpty) {    // nếu danh sách rỗng thì chuyển sang trang thứ 2 đó là ListEmpty (list_empty.dart)
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ListEmpty()),
                            );
                          } else {                // ngược lại thì chuyển sang trang thứ 3 đó là detail (detail_s2.dart)
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => detail(task: task),
                              ),
                            );
                          }
                        },

                      borderRadius: BorderRadius.circular(12), // Bo góc khi nhấn
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: bgColor,       // gán màu cho mỗi nhiệm vụ
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // title
                            Center(
                              child: Text(
                                task.title,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 4),

                            // checkbox and description
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: task.subtasks.isNotEmpty &&
                                      task.subtasks[0].isCompleted,
                                  onChanged: (value){},
                                  activeColor: Colors.black,
                                ),
                                Expanded(
                                  child: Text(
                                    task.description,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),

                            // status and dueDate
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style:
                                    TextStyle(fontSize: 14, color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: "Status: ",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(text: task.status),
                                    ],
                                  ),
                                ),
                                Text(
                                  task.dueDate,
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                      );
                    },
                  );
                }
              },
            ),
          ),


          // THANH TASKBAR
          SizedBox(height:42),
          // Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Màu nền
                // borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40),bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    color: Colors.grey,
                    blurRadius: 10, // Đổ bóng
                  ),
                ],
              ),
              width: 400,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.home, size: 33),
                    style: IconButton.styleFrom(
                      foregroundColor: Colors.blue,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 79),
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.calendar_today_outlined, size: 30),
                    ),
                  ),

                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.my_library_books_outlined,size: 30)
                  ),

                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.settings,size: 33))
                  ]
                ),
              ),
            )
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 152.0, bottom: 31.0),
          child: SizedBox(
            width: 70,
            height: 70,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(Icons.add,size: 32),
            ),
          ),
        )
    );
  }
}

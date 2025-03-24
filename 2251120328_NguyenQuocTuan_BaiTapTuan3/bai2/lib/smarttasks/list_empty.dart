import 'package:flutter/material.dart';
import 'package:bai2/model/task_model.dart';
import 'package:bai2/services/api_services.dart';

class ListEmpty extends StatefulWidget {
  const ListEmpty({super.key});
  @override
  State<ListEmpty> createState() => _ListEmptyState();
}

class _ListEmptyState extends State<ListEmpty> {
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

            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
              ),
              child: Column(
                children: [
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Image.asset('assets/Image/No_Task_Yet.png'),
                      ),

                      SizedBox(height: 14,),
                      Text(
                        'No Task Yet!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 10),
                      Text(
                        'Stay productive—add something to do',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                        ),
                      )

                    ],
                  ),
                ],
              ),
            ),

            // THÀNH TASKBAR
            // SizedBox(height: 668),
            Spacer(),
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

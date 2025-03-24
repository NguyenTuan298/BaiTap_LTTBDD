import 'package:bai2/model/task_model.dart';
import 'package:flutter/material.dart';

class detail extends StatelessWidget {
  final Task task;
  detail({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 18),
              Padding(
                padding: const EdgeInsets.only(top: 35,right: 100),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                        size: 33,
                      ),
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue
                      )
                  ),
                ),
              ),

              // Hiển thị Detail
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  'Detail',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40,left: 50),
                child: SizedBox(
                  width: 110,
                  child: IconButton(
                      onPressed: (){},
                      icon: Image.asset('assets/Image/Recycle_Bin.png',),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 15),


          // Hiển thị Tiêu đề và Mô tả nhiệm vụ
          // title
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: RichText(
                  softWrap: true,
                  text: TextSpan(
                    text: task.title,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  )
                ),
              ),
            ],
          ),
          SizedBox(height: 3),

          // description
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: RichText(
              softWrap: true,      // ko tự xuống dòng
              text: TextSpan(
                text: task.description,
                style: TextStyle(fontSize: 17, color: Colors.grey[700]),
              ),
            ),
          ),
          SizedBox(height: 20),


          // Trạng thái (Category),  Danh mục (Status), Độ ưu tiên (Priority)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 13),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.pink[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildInfoColumn(ImageIcon(AssetImage('assets/Image/category.png')), "Category", task.category),       // tạo 1 widget buildInfoColumn
                buildInfoColumn(ImageIcon(AssetImage('assets/Image/Status.png')), "Status", task.status),
                buildInfoColumn(ImageIcon(AssetImage('assets/Image/Priority.png')), "Priority", task.priority),
              ],
            ),
          ),
          SizedBox(height: 15),


          // Subtasks
          Padding(
            padding: const EdgeInsets.only(right: 290),
            child: Text(
              "Subtasks",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 5),

          // Thành phần của Subtasks
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: task.subtasks.map((subtask) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: subtask.isCompleted,
                            onChanged: (bool? value) {},
                          ),
                          Expanded(
                            child: Text(
                              subtask.title,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
          SizedBox(height: 0),


          // Attachments
          Padding(
            padding: const EdgeInsets.only(right: 240),
            child: Text("Attachments", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  children: task.attachments.map((attachment) {
                    return Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),

                      // Thành phần của Attachments
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.attach_file),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                attachment.fileName,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }


  // Widget hiển thị thông tin Category, Status, Priority
  Widget buildInfoColumn(Widget imageIcon , String label, String value) {
    return Column(
      children: <Widget>[
        imageIcon,
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

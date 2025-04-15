import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/homework.dart';
import '../viewmodels/homework_viewmodel.dart';

class User_Profile extends StatelessWidget {
  const User_Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Controllers để lấy dữ liệu từ TextField
    final taskController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.05,
              left: screenWidth * 0.03,
              right: screenWidth * 0.04,
            ),
            child: Row(
              children: [
                Center(
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                    ),
                    style: IconButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.17),
                const Expanded(
                  child: Text(
                    'Add News',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),


          SizedBox(height: screenHeight * 0.05),
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.765, top: screenHeight * 0.01),
            child: Text(
              "Task",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.001), // Khoảng cách giữa "Task" và TextField
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, // Căn trái và phải
              vertical: screenHeight * 0.02,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blueAccent),
              ),
              child: TextField(
                controller: taskController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.01),
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.55, top: screenHeight * 0.02),
            child: Text(
              "Description",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.001),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blueAccent),
              ),
              child: TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.02),
          ElevatedButton(
              onPressed: () async {
                if (taskController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
                  // Thêm vào danh sách
                  Provider.of<HomeworkProvider>(context, listen: false).addHomework(
                    Homework(
                      task: taskController.text,
                      description: descriptionController.text,
                    ),
                  );

                  // Xóa dữ liệu sau khi thêm
                  taskController.clear();
                  descriptionController.clear();

                  // Thông báo thành công
                  await ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Đã thêm thành công!"),
                      duration: Duration(seconds: 1), // Thời gian ngắn vừa đủ
                      behavior: SnackBarBehavior.fixed,
                    ),
                  ).closed;

                  // Quay lại trang Home_Work
                  Navigator.pop(context);

                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    Center(child: SnackBar(content: Text("Vui lòng nhập đủ thông tin!"))) as SnackBar,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Add",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
          ),
          SizedBox(height: screenHeight * 0.01)
        ],
      ),
    );
  }
}
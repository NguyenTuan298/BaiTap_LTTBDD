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
  void initState() {
    super.initState();
    futureTasks = ApiService.fetchTasks(context).then((tasks) {
      return tasks.where((t) => t.id != null).toList();
    }).catchError((error) {
      print("Error fetching data: $error");
      return [];
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    // Define responsive padding and font sizes
    final double horizontalPadding = screenWidth * 0.05;
    final double verticalPadding = screenHeight * 0.02;
    final double iconSize = screenWidth * 0.07;
    final double logoSize = screenWidth * 0.15; // Adjusted for smaller screens
    final double noTaskImageSize = screenWidth * 0.3; // Responsive image size

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // App Bar Section
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding * 2,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/Image/UTH_todolist.png',
                    width: logoSize,
                    height: logoSize,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SmartTasks',
                          style: TextStyle(
                            fontSize: screenWidth * 0.07,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          'A simple and efficient to-do app',
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/Image/Notification.png'),
                    iconSize: iconSize,
                  ),
                ],
              ),
            ),

            // No Tasks Section
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: screenWidth * 0.6),
                  child: Container(
                    width: screenWidth * 0.9, // Responsive width
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/Image/No_Task_Yet.png',
                          width: noTaskImageSize,
                          height: noTaskImageSize,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'No Tasks Yet!',
                          style: TextStyle(
                            fontSize: screenWidth * 0.08,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'Stay productive—add something to do',
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Bottom Navigation Bar
            Padding(
              padding: EdgeInsets.only(bottom: verticalPadding),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 2,
                      color: Colors.grey,
                      blurRadius: 10,
                    ),
                  ],
                ),
                width: screenWidth * 0.9,
                height: isLandscape ? screenHeight * 0.15 : screenHeight * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.home, size: iconSize),
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.blue,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.calendar_today_outlined, size: iconSize),
                    ),
                    SizedBox(height: 10),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.my_library_books_outlined, size: iconSize),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.settings, size: iconSize),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          right: screenWidth * 0.36,
          bottom: screenHeight * 0.06,
        ),
        child: SizedBox(
          width: screenWidth * 0.18,
          height: screenWidth * 0.18,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(Icons.add, size: 30,),
          ),
        ),
      ),
    );
  }
}
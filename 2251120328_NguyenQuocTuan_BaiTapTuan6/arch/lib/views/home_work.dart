
import 'package:arch/views/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/homework_viewmodel.dart';

class  Home_Work extends StatelessWidget {
  const Home_Work({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<Color> colors = [
      const Color(0xFFF48FB1),
      const Color(0xFFC5E1A5),
      const Color(0xFF4FC3F7),
    ];

    // Lấy danh sách từ Provider
    final homeworks = Provider.of<HomeworkProvider>(context).homeworks;

    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.02,
                  left: screenWidth * 0.03,
                  right: screenWidth * 0.04
              ),
              child: Row(
                children: <Widget>[
                  Center(
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          size: 20),
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.3),
                  const Expanded(
                    child: Text(
                      'List',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: ()  {
                    },
                    icon: Image.asset('assets/image.png'),
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.04),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: ListView.builder(
                  itemCount: homeworks .length,
                  itemBuilder: (context, index) {
                    final homework = homeworks[index];
                    final listview_color = colors[index % colors.length];

                    return Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: listview_color,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              spreadRadius: 1,
                              offset: Offset(0, 3),
                            ),
                          ],
                          border: Border.all(color: Colors.blueAccent),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              homework.task,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Text(
                              homework.description,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Thanh tabbar
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.03),
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
                height: screenHeight * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.home, size: screenWidth * 0.08),
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.blue,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.calendar_today_outlined,
                          size: screenWidth * 0.07),
                    ),
                    SizedBox(height: screenHeight * 0.15),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.my_library_books_outlined,
                          size: screenWidth * 0.07),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.settings, size: screenWidth * 0.08),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            right: screenWidth * 0.38, bottom: screenHeight * 0.077),
        child: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => User_Profile()),
              );
            },
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(Icons.add, size: screenWidth * 0.08),
          ),
        ),
      ),
    );
  }
}

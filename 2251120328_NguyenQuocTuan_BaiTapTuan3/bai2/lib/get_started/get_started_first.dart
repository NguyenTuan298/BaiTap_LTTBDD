import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'get_started_second.dart';
import 'get_started_third.dart';
import 'package:bai2/smarttasks/todo_list.dart';

void main() => runApp(MaterialApp(home: Get_Started_First()));

class Get_Started_First extends StatefulWidget {
  const Get_Started_First({super.key});

  @override
  State<Get_Started_First> createState() => _Get_Started_FirstState();
}

class _Get_Started_FirstState extends State<Get_Started_First> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(            // tạo các Indicator (chấm tròn, dấu gạch, hình dạng tùy biến) cho PageView
            controller: _pageController,
                  count: 3,
                  effect: WormEffect(
                    activeDotColor: Colors.blue,
                    dotColor: Colors.grey,
                    dotHeight: 8.0,
                    dotWidth: 9.0,
                    spacing: 5.0,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _pageController.animateToPage(    // Phương thức animateToPage giúp chuyển đến một trang cụ thể
                      2,                              // số thứ tự trang muốn chuyển đến
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,         // kiểu hiệu ứng chuyển động
                    );
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Nội dung PageView
          Expanded(               // chiếm hết không gian còn lại (parent) theo chiều Row hoặc Column
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: [
                buildPage(
                  image: 'assets/Image/portfolio.png',
                  title: 'Easy Time Management',
                  subtitle: 'With management based on priority and \n daily tasks, it will give you convenience in \n managing and determining the tasks that \n must be done first ',
                ),
                Get_Started_Second(),
                Get_Started_Third(),
              ],
            ),
          ),

          // mũi tên + Next/Get Started
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (currentIndex != 0) ...[       // Hiển thị nút mũi tên khi không phải trang đầu
                  GestureDetector(
                    onTap: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                    ),
                  ),
                  SizedBox(width: 15),
                ],

                // Nút Next / Get Started
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (currentIndex < 2) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          // Khi tới cuối sẽ quay lại trang đầu
                          // _pageController.jumpToPage(0);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TodoList()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        currentIndex < 2 ? "Next" : "Get Started",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Trang 1
  Widget buildPage({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 200),
        SizedBox(height: 30),
        Text(
          title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

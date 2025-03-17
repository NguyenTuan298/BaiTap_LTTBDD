import 'package:flutter/material.dart';

class Get_Started_Second extends StatelessWidget {
  const Get_Started_Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/charts.png', height: 200),
        SizedBox(height: 30),
        Text(
          'Increase Work Effectiveness',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          'Time management and determination \n of more important tasks will give your job \n statistics better and always improve.',
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

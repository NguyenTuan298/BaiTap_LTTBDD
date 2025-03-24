import 'package:flutter/material.dart';

class Get_Started_Third extends StatelessWidget {
  const Get_Started_Third({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/Image/new_message.png', height: 200),
        SizedBox(height: 30),
        Text(
          'Reminder Notification',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          'The advantage of this application is that it \n also provides reminders for you so you \n dont forget to keep doing your \n assignments well and according to the \n time you have set',
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

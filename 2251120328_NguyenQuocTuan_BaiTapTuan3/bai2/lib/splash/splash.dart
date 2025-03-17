import 'package:flutter/material.dart';
import '../get_started/get_started_first.dart';


void main() => runApp(MaterialApp(
  home: Splash_Screen(),
  debugShowCheckedModeBanner: false,
));

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState(){
    super.initState();
    redirect();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0,350,0,0),
            child: Center(
              child: Image.asset(
                'assets/logo_UTH.png',
                height: 100,
                width: 1000,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(90,0,0,0),
            child: Text(
              'UTH SmartTasks',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
  Future<void> redirect() async{
    await Future.delayed(const Duration(seconds: 6));
    if (!mounted) return;
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const Get_Started_First()));
  }
}

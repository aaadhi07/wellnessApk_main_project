import 'dart:async';
import 'package:flutter/material.dart';
import 'package:main_project_ui/view/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF006D77),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            // Icon(
            //   Icons.self_improvement,
            //   size: 100,
            //   color: Colors.white,
            // ),
            CircleAvatar(
                radius: 52,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2024/04/19/22/25/man-8707406_1280.png",
                  ),
                  radius: 50,
                )),
            SizedBox(height: 20),
            // App Name
            Text(
              'Wellness App',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Your Journey to Wellness Starts Here',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 30),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

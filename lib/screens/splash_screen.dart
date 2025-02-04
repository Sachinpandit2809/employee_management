import 'dart:async';

import 'package:employee_management/extension/numExt.dart';
import 'package:employee_management/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
                radius: 140,
                backgroundImage: AssetImage("assets/images/image.png")),
            40.heightBox,
            const Text(
              "Employee App",
              style: TextStyle(
                fontSize: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}

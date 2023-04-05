import 'dart:async';

import 'package:flutter/material.dart';
import 'package:milo/screens/home.dart';
import 'package:milo/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Material(
        color:  Colors.deepPurple,
        child: Center(
          child: Text(
            'MINTO',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),
          ),
        ),
        // backgroundColor: Colors.deepPurple,
       
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:milo/screens/home.dart';
import 'package:milo/screens/splash.dart';
import 'package:milo/utils/routes.dart';

import 'screens/login.dart';

main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (context)=> const SplashScreen(),
        MyRoutes.home:(context) => const HomeScreen(),
        MyRoutes.login:(context) => const LoginScreen(),

      },
    );
  }
}
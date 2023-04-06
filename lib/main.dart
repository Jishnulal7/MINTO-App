import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milo/screens/home.dart';
import 'package:milo/screens/menu.dart';
import 'package:milo/screens/splash.dart';
// import 'package:milo/screens/table_selection.dart';
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
      theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
      debugShowCheckedModeBanner: false,
      // initialRoute: MyRoutes.home,
      routes: {
        '/': (context) => const SplashScreen(),
        MyRoutes.login: (context) => const LoginScreen(),
        MyRoutes.home: (context) => const TableSelectionScreen(),
        MyRoutes.menu: (context) => const MenuScreen(
              tableNumber: '',
            ),
      },
    );
  }
}

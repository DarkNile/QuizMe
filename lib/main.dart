import 'package:dtcapp/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DTC Test App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

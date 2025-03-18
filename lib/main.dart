import 'package:flutter/material.dart';
import 'package:tuan3th/pages/g_1.dart';
import 'package:tuan3th/pages/g_2.dart';
import 'package:tuan3th/pages/g_3.dart';
import 'package:tuan3th/pages/home_page.dart';
import 'package:tuan3th/pages/real_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage() ,
      routes: {
        'home_page': (context) => HomePage(),
        'g_1': (context) => G1(),
        'g_2': (context) => G2(),
        'g_3': (context) => G3(),
        'real_home_page': (context) => RealHomePage(),
      },
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tuan3th/auth/main_page.dart';
import 'package:tuan3th/firebase_options.dart';
import 'package:tuan3th/pages/g_1.dart';
import 'package:tuan3th/pages/g_2.dart';
import 'package:tuan3th/pages/g_3.dart';
import 'package:tuan3th/pages/home_page.dart';
import 'package:tuan3th/pages/login_page.dart';
import 'package:tuan3th/pages/real_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("Fire da khoi tao thanh cong");
  }catch(e){
    print("Loi khi khoi tao Firebase: $e");
  }
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
        'main_page':(context) => MainPage(),
        'home_page': (context) => HomePage(),
        'g_1': (context) => G1(),
        'g_2': (context) => G2(),
        'g_3': (context) => G3(),
        'real_home_page': (context) => RealHomePage(),
      },
    );
  }
}

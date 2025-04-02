import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tuan3th/auth/auth_page.dart';
import 'package:tuan3th/pages/real_home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            if(snapshot.hasData) {
              return RealHomePage();
            }
            else{
              return AuthPage();
            }
          }),
    );
  }
}

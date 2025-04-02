import 'package:flutter/material.dart';
import 'package:tuan3th/pages/login_page.dart';
import 'package:tuan3th/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(showRegisterPage: toogleScreens,);

    }else{
      return RegisterPage(showLoginPage: toogleScreens,);
    }
  }
  void toogleScreens(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
}

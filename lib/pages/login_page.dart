import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tuan3th/pages/forgot_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({super.key,required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future logIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _emailController.text.trim(),
    password: _passwordController.text.trim());
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/img_7.png',width: 80,height: 80,),
                  SizedBox(height: 10,),
                  Text("SmartTasks",style: TextStyle(fontFamily: "Righteous",fontSize: 30,color: Colors.blue),
                  ),
                  SizedBox(height: 10,),
                  Text("A simple and efficient to-do app",style: TextStyle(fontSize: 25,color: Colors.blue),
                  ),
                  SizedBox(height: 10,),
                  Text("Login",style: TextStyle(fontSize: 30,color: Colors.blue,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Your email', // Thay "Row" thành text đơn giản
                            labelStyle: TextStyle(color: Colors.blue), // Chỉnh màu cho label nếu muốn
                            hintText: "Email@.gmail.com...",
                            hintStyle: TextStyle(color: Colors.black), // Màu cho hintText
                            prefixIcon: Icon(Icons.mail_outline,), // Dùng prefixIcon thay vì Row
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password', // Thay "Row" thành text đơn giản
                            labelStyle: TextStyle(color: Colors.blue), // Chỉnh màu cho label nếu muốn
                            hintText: "Password...",
                            hintStyle: TextStyle(color: Colors.black), // Màu cho hintText
                            prefixIcon: Icon(Icons.key,), // Dùng prefixIcon thay vì Row
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context){return ForgotPage();
                            },
                            ),
                            );
                          },
                          child: Text("Forgot Password?",
                            style: TextStyle(
                                color: Colors.blue,fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GestureDetector(
                      onTap: logIn,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(40)
                        ),

                        child: Center(
                          child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have a account?",style: TextStyle(fontWeight: FontWeight.bold),),
                      GestureDetector(
                        onTap: widget.showRegisterPage ,
                        child: Text
                          (" Sign up",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("OR",style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold),),

                  SizedBox(height: 5,),
                  Container(
                    height: 2,  // Chiều cao của line
                    color: Colors.grey,  // Màu sắc của line
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){},// dung cai nay de dang nhap bang google,
                      child: Container(
                          child: Image.asset('assets/images/img_8.png',width: 50,height: 50,fit: BoxFit.contain,)))



                ],
              ),
            ),
          ),
      ),

    );
  }
}

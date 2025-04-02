import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // ✅ HÀM RESET PASSWORD
  Future passwordReset() async {
    print("⚡️ passwordReset() called");

    // Kiểm tra nếu email trống
    if (_emailController.text.trim().isEmpty) {
      print("⚠️ Email field is empty");
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Please enter your email."),
          );
        },
      );
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );

      print("✅ Password reset email sent!");

      if (!mounted) return;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              "Password reset link sent! Check your email.",
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print("❌ Firebase Error: ${e.code} - ${e.message}");

      if (!mounted) return;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              "Error: ${e.message}",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          );
        },
      );
    } catch (e) {
      print("❌ Unknown Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/img_7.png', width: 80, height: 80),
                SizedBox(height: 10),
                Text(
                  "SmartTasks",
                  style: TextStyle(fontFamily: "Righteous", fontSize: 30, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  "A simple and efficient to-do app",
                  style: TextStyle(fontSize: 25, color: Colors.blue),
                ),
                SizedBox(height: 25),
                Text(
                  "Forgot Password",
                  style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Your email',
                          labelStyle: TextStyle(color: Colors.blue),
                          hintText: "Email@.gmail.com...",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.mail_outline), // Thêm icon vào đây
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GestureDetector(
                    onTap: passwordReset,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(40)
                      ),

                      child: Center(
                        child: Text("Reset password",style: TextStyle(color: Colors.white,fontSize: 15),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

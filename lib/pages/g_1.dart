import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class G1 extends StatefulWidget {
  const G1({super.key});

  @override
  State<G1> createState() => _G1State();
}

class _G1State extends State<G1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // Tăng chiều cao AppBar
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: 0, // G1 là trang cuối
                  decorator: DotsDecorator(
                    size: const Size.square(8.0),
                    activeSize: const Size(18.0, 8.0),
                    activeColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'real_home_page');
              },
              child: const Text("Skip",
                  style: TextStyle(color: Colors.blue, fontSize: 12)),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// **Hình ảnh**
            Image.asset('assets/images/img_1.png', width: 320, height: 260),

            const SizedBox(height: 30),

            /// **Tiêu đề**
            const Text(
              "Easy Time Management",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            /// **Mô tả**
            Text(
              "With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first.",
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            /// **Nút Next**
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "g_2");
              },
              child: const Text("Next",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Tạo hiệu ứng fade-out
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..reverse(from: 1.0); // Bắt đầu từ 1.0 → 0.0

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    // Chuyển màn hình khi hiệu ứng kết thúc
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        Navigator.pushReplacementNamed(context, 'g_1');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Giải phóng bộ nhớ tránh rò rỉ
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: FadeTransition(
            opacity: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/img.png', height: 90, width: 120),
                const SizedBox(height: 30),
                const Text(
                  "UTH SmartTasks",
                  style: TextStyle(
                    fontFamily: "Righteous",
                    fontSize: 30,
                    color: Colors.blueAccent,
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

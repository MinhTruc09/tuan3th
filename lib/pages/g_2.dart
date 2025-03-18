import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class G2 extends StatefulWidget {
  const G2({super.key});

  @override
  State<G2> createState() => _G2State();
}

class _G2State extends State<G2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: 1,
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
            Image.asset('assets/images/img_2.png', width: 320, height: 260),
            const SizedBox(height: 30),
            const Text(
              "Increase Work Effectiveness",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "Time management and the determination of more important tasks will give your job statistics better and always improve.",
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'g_1');
                  },
                  child: const Icon(Icons.arrow_back, color: Colors.white,size: 28,),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: const Size(250,50),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "g_3");
                  },
                  child: const Text("Next",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

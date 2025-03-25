import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tuan3th/pages/task_list_page.dart';

class RealHomePage extends StatefulWidget {
  const RealHomePage({super.key});

  @override
  State<RealHomePage> createState() => _RealHomePageState();
}

class _RealHomePageState extends State<RealHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    TaskListPage(),
    Center(child: Text('CALENDAR PAGE', style: TextStyle(fontSize: 40))),
    Center(child: Text('DOCUMENTS PAGE', style: TextStyle(fontSize: 40))),
    Center(child: Text('SETTING PAGE', style: TextStyle(fontSize: 40))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        leading: Image.asset(
          'assets/images/img_4.png',
          height: 40,
          width: 40,
          fit: BoxFit.contain,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SmartTasks",
              style: TextStyle(
                fontFamily: "Righteous",
                fontSize: 24,
                color: Colors.blueAccent,
              ),
            ),
            Text(
              "A simple and efficient to-do app",
              style: TextStyle(fontSize: 12, color: Colors.blueAccent),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notification_add,
                color: Colors.orangeAccent,
                size: 24,
              ))
        ],
      ),
      body: _pages[_selectedIndex], // Hiển thị trang tương ứng
      bottomNavigationBar: BottomAppBar(
        color: Colors.white, // Màu nền để đồng bộ với FAB
        shape: CircularNotchedRectangle(), // Bo góc FAB
        notchMargin: 8.0, // Giữ khoảng cách hợp lý giữa FAB và BottomAppBar
        child: Container(
          height: 60, // Điều chỉnh chiều cao để FAB vừa vặn
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ), // Bo góc trên của BottomAppBar
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Tạo hiệu ứng đổ bóng
                blurRadius: 5,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home,
                    color: _selectedIndex == 0 ? Colors.blue : Colors.grey),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: Icon(Icons.calendar_today,
                    color: _selectedIndex == 1 ? Colors.blue : Colors.grey),
                onPressed: () => _onItemTapped(1),
              ),
              SizedBox(width: 40), // Chừa chỗ cho FAB
              IconButton(
                icon: Icon(Icons.insert_drive_file,
                    color: _selectedIndex == 2 ? Colors.blue : Colors.grey),
                onPressed: () => _onItemTapped(2),
              ),
              IconButton(
                icon: Icon(Icons.settings,
                    color: _selectedIndex == 3 ? Colors.blue : Colors.grey),
                onPressed: () => _onItemTapped(3),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        elevation: 4, // Tạo hiệu ứng nổi nhẹ
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}

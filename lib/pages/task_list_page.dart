import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuan3th/pages/all_class.dart';
import 'package:tuan3th/pages/task_detail_page.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<dynamic> _tasks = [];

  Future<void> fetchTasks() async {
    final response =
    await http.get(Uri.parse('https://amock.io/api/researchUTH/tasks'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        _tasks = jsonData['data'];
      });
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      _tasks[index]['isCompleted'] = !_tasks[index]['isCompleted'];
    });

    // TODO: Gửi request cập nhật trạng thái lên server nếu cần
  }

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return _tasks.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        var task = _tasks[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskDetailPage(task: Task.fromJson(task)),
              ),
            );
          },
          child: _buildComponentCard(
            title: task['title'] ?? 'No title',
            description: task['description'] ?? 'No description',
            status: task['status'] ?? 'Unknown',
            color: _getStatusColor(task['status']),
            isCompleted: task['isCompleted'] == true || task['isCompleted'] == 1,
            onToggleCompleted: () => _toggleTaskCompletion(index),
          ),
        );
      },
    );

  }

  Widget _buildComponentCard({
    required String title,
    required String description,
    required String status,
    required Color color,
    required bool isCompleted,
    required VoidCallback onToggleCompleted,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: isCompleted,
            onChanged: (bool? value) => onToggleCompleted(),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 4),
                Text(
                  "Status: $status",
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "in progress":
        return Colors.red[200]!;
      case "pending":
        return Colors.blue[200]!;
      case "completed":
        return Colors.green[200]!;
      default:
        return Colors.grey[200]!;
    }
  }
}

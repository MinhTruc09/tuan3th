import 'package:flutter/material.dart';
import 'all_class.dart'; // Thay bằng file chứa class Task, Subtask

class TaskDetailPage extends StatelessWidget {
  final Task task;

  const TaskDetailPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Text("Detail", style: TextStyle(color: Colors.blue, fontSize: 24, fontFamily: "Righteous")),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.orangeAccent),
            onPressed: () {
              // TODO: Xử lý xóa task
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(task.description, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
            _buildTaskInfo(),
            const SizedBox(height: 16),
            const Text("Subtasks", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            _buildSubtaskList(),
            const SizedBox(height: 16),
            if (task.attachments.isNotEmpty) ...[
              const Text("Attachments", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              _buildAttachmentList(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTaskInfo() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _getStatusColor(task.status),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInfoItem(Icons.category, "Category", task.category),
          _buildInfoItem(Icons.chrome_reader_mode_sharp, "Status", task.status),
          _buildInfoItem(Icons.flag, "Priority", task.priority),
        ],
      ),
    );
  }

  Widget _buildSubtaskList() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: task.subtasks.map((subtask) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Checkbox(
                  value: subtask.isCompleted,
                  onChanged: (bool? value) {
                    // TODO: Xử lý cập nhật trạng thái subtask
                  },
                  activeColor: Colors.grey, // Màu nền checkbox
                  checkColor: Colors.black, // Màu dấu tích
                ),
                title: Text(subtask.title),
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildAttachmentList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: task.attachments.map((attachment) {
          return ListTile(
            leading: const Icon(Icons.attachment),
            title: Text(attachment.fileName),
            onTap: () {
              // TODO: Mở file đính kèm
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, size: 24),
        Text(label, style: const TextStyle(fontSize: 12)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
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

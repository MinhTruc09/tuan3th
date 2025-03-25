class Task {
  final int id;
  final String title;
  final String description;
  final String status;
  final String priority;
  final String category;
  final DateTime dueDate;
  final List<Subtask> subtasks;
  final List<Attachment> attachments;
  final List<Reminder> reminders;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.category,
    required this.dueDate,
    required this.subtasks,
    required this.attachments,
    required this.reminders,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? 'pending',
      priority: json['priority'] ?? 'low',
      category: json['category'] ?? 'general',
      dueDate: json['dueDate'] != null ? DateTime.tryParse(json['dueDate']) ?? DateTime.now() : DateTime.now(),
      subtasks: (json['subtasks'] as List?)?.map((item) => Subtask.fromJson(item)).toList() ?? [],
      attachments: (json['attachments'] as List?)?.map((item) => Attachment.fromJson(item)).toList() ?? [],
      reminders: (json['reminders'] as List?)?.map((item) => Reminder.fromJson(item)).toList() ?? [],
    );
  }
}

class Subtask {
  final int id;
  final String title;
  final bool isCompleted;

  Subtask({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  factory Subtask.fromJson(Map<String, dynamic> json) {
    return Subtask(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      isCompleted: json['isCompleted'] ?? false,
    );
  }
}

class Attachment {
  final String fileName;
  final String fileUrl;

  Attachment({
    required this.fileName,
    required this.fileUrl,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      fileName: json['fileName'] ?? '',
      fileUrl: json['fileUrl'] ?? '',
    );
  }
}

class Reminder {
  final DateTime remindAt;

  Reminder({
    required this.remindAt,
  });

  factory Reminder.fromJson(Map<String, dynamic> json) {
    return Reminder(
      remindAt: json['remindAt'] != null ? DateTime.tryParse(json['remindAt']) ?? DateTime.now() : DateTime.now(),
    );
  }
}

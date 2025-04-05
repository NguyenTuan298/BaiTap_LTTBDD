class Task {
  final String? id;
  final String title;
  final String description;
  final String category;
  final String status;
  final String priority;
  final String dueDate;
  final List<Subtask> subtasks;
  final List<Attachment> attachments;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    required this.priority,
    required this.dueDate,
    required this.subtasks,
    required this.attachments,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id']?.toString(),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      status: json['status'] ?? '',
      priority: json['priority'] ?? '',
      dueDate: json['dueDate'] ?? '',
      subtasks: (json['subtasks'] as List<dynamic>?)
          ?.map((subtask) => Subtask.fromJson(subtask))
          .toList() ??
          [],
          attachments: (json['attachments'] as List<dynamic>?)
          ?.map((attachment) => Attachment.fromJson(attachment))
          .toList() ??
          [],
    );
  }
}

class Subtask {
  final String title;
  final bool isCompleted;

  Subtask({required this.title, required this.isCompleted});

  factory Subtask.fromJson(Map<String, dynamic> json) {
    return Subtask(
      title: json['title'] ?? '',
      isCompleted: json['isCompleted'] ?? false,
    );
  }
}

class Attachment {
  final String fileName;

  Attachment({required this.fileName});

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      fileName: json['fileName'] ?? '',
    );
  }
}
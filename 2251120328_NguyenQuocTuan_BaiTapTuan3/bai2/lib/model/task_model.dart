// Model cho Subtask (công việc con)
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
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
    };
  }
}

// Model cho Attachment (tệp đính kèm)
class Attachment {
  final int id;
  final String fileName;
  final String fileUrl;

  Attachment({
    required this.id,
    required this.fileName,
    required this.fileUrl,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'],
      fileName: json['fileName'],
      fileUrl: json['fileUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fileName': fileName,
      'fileUrl': fileUrl,
    };
  }
}

// Model cho Reminder
class Reminder {
  final int id;
  final String time;
  final String type;

  Reminder({
    required this.id,
    required this.time,
    required this.type,
  });

  factory Reminder.fromJson(Map<String, dynamic> json) {
    return Reminder(
      id: json['id'],
      time: json['time'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'time': time,
      'type': type,
    };
  }
}

// Model chính cho Task
class Task {
  final int id;
  final String title;
  final String description;
  final String status;
  final String priority;
  final String category;
  final String dueDate;
  final String createdAt;
  final String updatedAt;
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
    required this.createdAt,
    required this.updatedAt,
    required this.subtasks,
    required this.attachments,
    required this.reminders,
  });

  // Chuyển từ JSON sang Object
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      priority: json['priority'],
      category: json['category'],
      dueDate: json['dueDate'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      subtasks: (json['subtasks'] as List)
          .map((item) => Subtask.fromJson(item))
          .toList(),
      attachments: (json['attachments'] as List)
          .map((item) => Attachment.fromJson(item))
          .toList(),
      reminders: (json['reminders'] as List)
          .map((item) => Reminder.fromJson(item))
          .toList(),
    );
  }

  // Chuyển từ Object sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'priority': priority,
      'category': category,
      'dueDate': dueDate,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'subtasks': subtasks.map((subtask) => subtask.toJson()).toList(),
      'attachments': attachments.map((attachment) => attachment.toJson()).toList(),
      'reminders': reminders.map((reminder) => reminder.toJson()).toList(),
    };
  }
}

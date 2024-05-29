class Notification {
  final String message;
  final DateTime timestamp;

  Notification({required this.message, required this.timestamp});

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
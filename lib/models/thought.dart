class Thought {
  final String id;
  final String content;
  final DateTime date;

  Thought({
    required this.id,
    required this.content,
    required this.date,
  });

  // Convert a Thought object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'date': date.toIso8601String(),
    };
  }

  // Create a Thought object from a JSON map
  factory Thought.fromJson(Map<String, dynamic> json) {
    return Thought(
      id: json['id'],
      content: json['content'],
      date: DateTime.parse(json['date']),
    );
  }
}

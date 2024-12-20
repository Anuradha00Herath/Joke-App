// models/joke.dart
class Joke {
  final String id;
  final String content;

  Joke({required this.id, required this.content});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      id: json['id'] ?? '', // Use a fallback value if null
      content: json['content'] ?? '', // Use a fallback value if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
    };
  }
}

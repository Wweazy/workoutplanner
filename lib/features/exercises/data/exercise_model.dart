class Exercise {
  final int id;
  final String name;
  final String category;

  Exercise({
    required this.id,
    required this.name,
    required this.category,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    final translations = json['translations'] as List<dynamic>?;

    String name = 'Unknown exercise';
    if (translations != null && translations.isNotEmpty) {
      name = translations.first['name'] ?? name;
    }

    return Exercise(
      id: json['id'],
      name: name,
      category: json['category']?['name'] ?? '',
    );
  }
}

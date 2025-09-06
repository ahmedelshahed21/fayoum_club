class Activate {
  final int id;
  final String title;

  Activate({
    required this.id,
    required this.title,
  });

  factory Activate.fromJson(Map<String, dynamic> json) {
    return Activate(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
    };
  }
}
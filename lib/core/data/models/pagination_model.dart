class Pagination {
  final int total;
  final int currentPage;
  final int perPage;
  final int totalPages;

  Pagination({
    required this.total,
    required this.currentPage,
    required this.perPage,
    required this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      total: json['total'] ?? 0,
      currentPage: json['currentPage'] ?? 0,
      perPage: json['perPage'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "total": total,
      "currentPage": currentPage,
      "perPage": perPage,
      "totalPages": totalPages,
    };
  }
}
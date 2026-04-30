class NewsModel {
  const NewsModel({
    required this.id,
    required this.title,
    required this.summary,
    required this.content,
    required this.imageUrl,
    required this.publishedAt,
    this.category = '',
  });

  final int id;
  final String title;
  final String summary;
  final String content;
  final String imageUrl;
  final DateTime publishedAt;
  final String category;

  NewsModel copyWith({
    int? id,
    String? title,
    String? summary,
    String? content,
    String? imageUrl,
    DateTime? publishedAt,
    String? category,
  }) {
    return NewsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      publishedAt: publishedAt ?? this.publishedAt,
      category: category ?? this.category,
    );
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      summary: json['summary'] as String? ?? '',
      content: json['content'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      publishedAt: DateTime.tryParse(json['publishedAt'] as String? ?? '') ?? DateTime(2000),
      category: json['category'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'content': content,
      'imageUrl': imageUrl,
      'publishedAt': publishedAt.toIso8601String(),
      'category': category,
    };
  }
}

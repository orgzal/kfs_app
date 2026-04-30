class EventModel {
  const EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.date,
    required this.imageUrl,
    this.isFeatured = false,
  });

  final int id;
  final String title;
  final String description;
  final String location;
  final DateTime date;
  final String imageUrl;
  final bool isFeatured;

  EventModel copyWith({
    int? id,
    String? title,
    String? description,
    String? location,
    DateTime? date,
    String? imageUrl,
    bool? isFeatured,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      date: date ?? this.date,
      imageUrl: imageUrl ?? this.imageUrl,
      isFeatured: isFeatured ?? this.isFeatured,
    );
  }

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      location: json['location'] as String? ?? '',
      date: DateTime.tryParse(json['date'] as String? ?? '') ?? DateTime(2000),
      imageUrl: json['imageUrl'] as String? ?? '',
      isFeatured: json['isFeatured'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'location': location,
      'date': date.toIso8601String(),
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
    };
  }
}

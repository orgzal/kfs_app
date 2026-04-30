class ProjectModel {
  const ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.progress,
    required this.imageUrl,
  });

  final int id;
  final String title;
  final String description;
  final String status;
  final double progress;
  final String imageUrl;

  ProjectModel copyWith({
    int? id,
    String? title,
    String? description,
    String? status,
    double? progress,
    String? imageUrl,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      status: json['status'] as String? ?? '',
      progress: (json['progress'] as num? ?? 0).toDouble(),
      imageUrl: json['imageUrl'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'progress': progress,
      'imageUrl': imageUrl,
    };
  }
}

class BannerModel {
  const BannerModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.targetRoute,
    this.isActive = true,
  });

  final int id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String targetRoute;
  final bool isActive;

  BannerModel copyWith({
    int? id,
    String? title,
    String? subtitle,
    String? imageUrl,
    String? targetRoute,
    bool? isActive,
  }) {
    return BannerModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      imageUrl: imageUrl ?? this.imageUrl,
      targetRoute: targetRoute ?? this.targetRoute,
      isActive: isActive ?? this.isActive,
    );
  }

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      targetRoute: json['targetRoute'] as String? ?? '',
      isActive: json['isActive'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'imageUrl': imageUrl,
      'targetRoute': targetRoute,
      'isActive': isActive,
    };
  }
}

class ServiceModel {
  const ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.iconKey,
    required this.route,
    this.isOnline = true,
  });

  final int id;
  final String name;
  final String description;
  final String iconKey;
  final String route;
  final bool isOnline;

  ServiceModel copyWith({
    int? id,
    String? name,
    String? description,
    String? iconKey,
    String? route,
    bool? isOnline,
  }) {
    return ServiceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      iconKey: iconKey ?? this.iconKey,
      route: route ?? this.route,
      isOnline: isOnline ?? this.isOnline,
    );
  }

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      iconKey: json['iconKey'] as String? ?? '',
      route: json['route'] as String? ?? '',
      isOnline: json['isOnline'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'iconKey': iconKey,
      'route': route,
      'isOnline': isOnline,
    };
  }
}

class TourismPlaceModel {
  const TourismPlaceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.imageUrl,
    this.rating = 0,
  });

  final int id;
  final String name;
  final String description;
  final String address;
  final String imageUrl;
  final double rating;

  TourismPlaceModel copyWith({
    int? id,
    String? name,
    String? description,
    String? address,
    String? imageUrl,
    double? rating,
  }) {
    return TourismPlaceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      address: address ?? this.address,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
    );
  }

  factory TourismPlaceModel.fromJson(Map<String, dynamic> json) {
    return TourismPlaceModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      address: json['address'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      rating: (json['rating'] as num? ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'address': address,
      'imageUrl': imageUrl,
      'rating': rating,
    };
  }
}

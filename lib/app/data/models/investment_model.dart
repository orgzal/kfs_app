class InvestmentModel {
  const InvestmentModel({
    required this.id,
    required this.title,
    required this.sector,
    required this.description,
    required this.budget,
    required this.location,
  });

  final int id;
  final String title;
  final String sector;
  final String description;
  final double budget;
  final String location;

  InvestmentModel copyWith({
    int? id,
    String? title,
    String? sector,
    String? description,
    double? budget,
    String? location,
  }) {
    return InvestmentModel(
      id: id ?? this.id,
      title: title ?? this.title,
      sector: sector ?? this.sector,
      description: description ?? this.description,
      budget: budget ?? this.budget,
      location: location ?? this.location,
    );
  }

  factory InvestmentModel.fromJson(Map<String, dynamic> json) {
    return InvestmentModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      sector: json['sector'] as String? ?? '',
      description: json['description'] as String? ?? '',
      budget: (json['budget'] as num? ?? 0).toDouble(),
      location: json['location'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'sector': sector,
      'description': description,
      'budget': budget,
      'location': location,
    };
  }
}

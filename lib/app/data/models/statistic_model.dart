class StatisticModel {
  const StatisticModel({
    required this.id,
    required this.label,
    required this.value,
    required this.unit,
    required this.iconKey,
  });

  final int id;
  final String label;
  final String value;
  final String unit;
  final String iconKey;

  StatisticModel copyWith({
    int? id,
    String? label,
    String? value,
    String? unit,
    String? iconKey,
  }) {
    return StatisticModel(
      id: id ?? this.id,
      label: label ?? this.label,
      value: value ?? this.value,
      unit: unit ?? this.unit,
      iconKey: iconKey ?? this.iconKey,
    );
  }

  factory StatisticModel.fromJson(Map<String, dynamic> json) {
    return StatisticModel(
      id: json['id'] as int? ?? 0,
      label: json['label'] as String? ?? '',
      value: json['value'] as String? ?? '',
      unit: json['unit'] as String? ?? '',
      iconKey: json['iconKey'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'value': value,
      'unit': unit,
      'iconKey': iconKey,
    };
  }
}

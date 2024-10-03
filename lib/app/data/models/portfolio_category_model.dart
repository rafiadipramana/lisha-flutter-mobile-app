class PortfolioCategoryModel {
  final int id;
  final String name;

  PortfolioCategoryModel({
    required this.id,
    required this.name,
  });

  factory PortfolioCategoryModel.fromJson(Map<String, dynamic> json) {
    return PortfolioCategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
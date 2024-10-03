import 'package:lisha/app/data/models/portfolio_category_model.dart';

class PortfolioModel {
  final int? id;
  final String title;
  final String? description;
  final String? imageUrl;
  final PortfolioCategoryModel category;

  PortfolioModel({
    this.id,
    required this.title,
    this.description,
    this.imageUrl,
    required this.category,
  });

  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    return PortfolioModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['image_url'],
      category: PortfolioCategoryModel.fromJson(json['category']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      if (description != null) 'description': description,
      if (imageUrl != null) 'image_url': imageUrl,
      'category_id': category.id,
    };
  }
}

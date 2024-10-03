import 'package:lisha/app/domain/entities/portfolio_category.dart';

class Portfolio {
  final int? id;
  final String title;
  final String? description;
  final String? imageUrl;
  final PortfolioCategory category;

  Portfolio({
    this.id,
    required this.title,
    this.description,
    this.imageUrl,
    required this.category,
  });
}
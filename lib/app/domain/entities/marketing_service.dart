class MarketingService {
  final int? id;
  final String? userId;
  final String title;
  final String? description;
  final num price;
  final String? imageUrl;
  final DateTime? createdAt;

  MarketingService({
    this.id,
    this.userId,
    required this.title,
    this.description,
    required this.price,
    this.imageUrl,
    this.createdAt,
  });
}
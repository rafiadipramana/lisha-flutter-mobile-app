class MarketingServiceModel {
  final int? id;
  final String? userId;
  final String title;
  final String? description;
  final num price;
  final String? imageUrl;
  final DateTime? createdAt;

  MarketingServiceModel({
    this.id,
    this.userId,
    required this.title,
    this.description,
    required this.price,
    this.imageUrl,
    this.createdAt,
  });

  factory MarketingServiceModel.fromJson(Map<String, dynamic> json) {
    return MarketingServiceModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      title: json['title'],
      description: json['description'] ?? '',
      price: json['price'],
      imageUrl: json['image_url'] ?? '',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      if (description != null) 'description': description,
      'price': price,
      if (imageUrl != null) 'image_url': imageUrl,
      if (createdAt != null) 'created_at': createdAt?.toIso8601String(),
    };
  }
}
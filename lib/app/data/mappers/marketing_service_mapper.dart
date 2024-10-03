import 'package:lisha/app/data/models/marketing_service_model.dart';
import 'package:lisha/app/domain/entities/marketing_service.dart';

class MarketingServiceMapper {
  static MarketingService fromModel(MarketingServiceModel model) {
    return MarketingService(
      id: model.id,
      userId: model.userId,
      title: model.title,
      description: model.description,
      price: model.price,
      imageUrl: model.imageUrl,
      createdAt: model.createdAt,
    );
  }

  static MarketingServiceModel fromEntity(MarketingService entity) {
    return MarketingServiceModel(
      id: entity.id,
      userId: entity.userId,
      title: entity.title,
      description: entity.description,
      price: entity.price,
      imageUrl: entity.imageUrl,
      createdAt: entity.createdAt,
    );
  }

  static List<MarketingService> fromModelList(List<MarketingServiceModel> models) {
    return models.map((model) => fromModel(model)).toList();
  }

  static List<MarketingServiceModel> fromEntityList(List<MarketingService> entities) {
    return entities.map((entity) => fromEntity(entity)).toList();
  }
}
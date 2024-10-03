import 'portfolio_category_mapper.dart';
import '../models/portfolio_model.dart';
import '../../domain/entities/portfolio.dart';

class PortfolioMapper {
  static Portfolio fromModel(PortfolioModel model) {
    return Portfolio(
      id: model.id,
      title: model.title,
      description: model.description,
      imageUrl: model.imageUrl,
      category: PortfolioCategoryMapper.fromModel(model.category),
    );
  }

  static PortfolioModel fromEntity(Portfolio entity) {
    return PortfolioModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      imageUrl: entity.imageUrl,
      category: PortfolioCategoryMapper.fromEntity(entity.category),
    );
  }

  static List<Portfolio> fromModelList(List<PortfolioModel> models) {
    return models.map(fromModel).toList();
  }

  static List<PortfolioModel> fromEntityList(List<Portfolio> entities) {
    return entities.map(fromEntity).toList();
  }
}
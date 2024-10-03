import 'package:lisha/app/data/models/portfolio_category_model.dart';
import 'package:lisha/app/domain/entities/portfolio_category.dart';

class PortfolioCategoryMapper {
  static PortfolioCategory fromModel(PortfolioCategoryModel model) {
    return PortfolioCategory(
      id: model.id,
      name: model.name,
    );
  }

  static PortfolioCategoryModel fromEntity(PortfolioCategory entity) {
    return PortfolioCategoryModel(
      id: entity.id,
      name: entity.name,
    );
  }

  static List<PortfolioCategory> fromModelList(List<PortfolioCategoryModel> models) {
    return models.map(fromModel).toList();
  }

  static List<PortfolioCategoryModel> fromEntityList(List<PortfolioCategory> entities) {
    return entities.map(fromEntity).toList();
  }
}
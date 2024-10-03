import 'package:lisha/app/domain/entities/portfolio_category.dart';
import 'package:lisha/app/domain/repositories/portfolio_repository.dart';

class GetPortfolioCategoriesUseCase {
  final PortfolioRepository portfolioRepository;
  
  GetPortfolioCategoriesUseCase({
    required this.portfolioRepository,
  });
  
  Future<List<PortfolioCategory>> execute() async {
    try {
      return await portfolioRepository.getPortfolioCategories();
    } catch (e) {
      rethrow;
    }
  }
}
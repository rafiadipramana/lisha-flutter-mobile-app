import 'package:lisha/app/domain/entities/portfolio.dart';
import 'package:lisha/app/domain/repositories/portfolio_repository.dart';

class AddPortfolioUseCase {
  final PortfolioRepository portfolioRepository;

  AddPortfolioUseCase({
    required this.portfolioRepository,
  });

  Future<void> execute(Portfolio portfolio) async {
    try {
      await portfolioRepository.addPortfolio(portfolio);
    } catch (e) {
      rethrow;
    }
  }
}
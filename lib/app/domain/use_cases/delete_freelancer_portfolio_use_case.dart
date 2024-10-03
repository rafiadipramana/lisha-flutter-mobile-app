import '../entities/portfolio.dart';
import '../repositories/portfolio_repository.dart';

class DeleteFreelancerPortfolioUseCase {
  final PortfolioRepository portfolioRepository;

  DeleteFreelancerPortfolioUseCase({
    required this.portfolioRepository,
  });

  Future<void> execute(Portfolio portfolio) async {
    try {
      await portfolioRepository.deletePortfolio(portfolio);
    } catch (e) {
      rethrow;
    }
  }
}

import '../entities/portfolio.dart';
import '../repositories/portfolio_repository.dart';

class UpdateFreelancerPortfolioUseCase {
  final PortfolioRepository portfolioRepository;

  UpdateFreelancerPortfolioUseCase({
    required this.portfolioRepository,
  });

  Future<void> execute({
    required Portfolio portfolio,
  }) async {
    try {
      await portfolioRepository.updatePortfolio(
        portfolio,
      );
    } catch (e) {
      rethrow;
    }
  }
}
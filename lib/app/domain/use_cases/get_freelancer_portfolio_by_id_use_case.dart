import 'package:lisha/app/domain/entities/portfolio.dart';
import 'package:lisha/app/domain/repositories/portfolio_repository.dart';

class GetFreelancerPortfolioByIdUseCase {
  final PortfolioRepository portfolioRepository;

  GetFreelancerPortfolioByIdUseCase({
    required this.portfolioRepository,
  });

  Future<Portfolio> execute({
    required int portfolioId,
  }) async {
    try {
      return await portfolioRepository.getPortfolioById(
        portfolioId,
      );
    } catch (e) {
      rethrow;
    }
  }
}
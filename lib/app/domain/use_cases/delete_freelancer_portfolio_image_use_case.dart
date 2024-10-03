import '../repositories/portfolio_repository.dart';

class DeleteFreelancerPortfolioImageUseCase {
  final PortfolioRepository portfolioRepository;

  DeleteFreelancerPortfolioImageUseCase({
    required this.portfolioRepository,
  });

  Future<void> execute({
    required String userId,
    required String imageUrl,
  }) async {
    try {
      await portfolioRepository.deletePortfolioImage(
        userId: userId,
        imageUrl: imageUrl,
      );
    } catch (e) {
      rethrow;
    }
  }
}

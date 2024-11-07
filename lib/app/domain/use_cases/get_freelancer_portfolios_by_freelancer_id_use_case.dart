import 'package:lisha/app/domain/repositories/portfolio_repository.dart';

import '../entities/portfolio.dart';

class GetFreelancerPortfoliosByFreelancerIdUseCase {
  final PortfolioRepository portfolioRepository;

  GetFreelancerPortfoliosByFreelancerIdUseCase({
    required this.portfolioRepository,
  });

  Future<List<Portfolio>> execute() async {
    return await portfolioRepository.getPortfoliosByFreelancerId();
  }
}
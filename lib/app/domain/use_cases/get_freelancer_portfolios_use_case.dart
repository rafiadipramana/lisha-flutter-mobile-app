import 'package:lisha/app/domain/repositories/portfolio_repository.dart';

import '../entities/portfolio.dart';

class GetFreelancerPortfoliosUseCase {
  final PortfolioRepository portfolioRepository;

  GetFreelancerPortfoliosUseCase({
    required this.portfolioRepository,
  });

  Future<List<Portfolio>> execute() async {
    return await portfolioRepository.getPortfolios();
  }
}
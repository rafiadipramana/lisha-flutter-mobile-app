import '../repositories/marketing_service_repository.dart';
import '../entities/marketing_service.dart';

class GetFreelancerMarketingServicesUseCase {
  final MarketingServiceRepository marketingServiceRepository;

  GetFreelancerMarketingServicesUseCase({
    required this.marketingServiceRepository,
  });

  Future<List<MarketingService>> execute() async {
    try {
      return await marketingServiceRepository.getMarketingServices();
    } catch (e) {
      rethrow;
    }
  }
}

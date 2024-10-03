import '../entities/marketing_service.dart';
import '../repositories/marketing_service_repository.dart';

class AddFreelancerMarketingServiceUseCase {
  final MarketingServiceRepository marketingServiceRepository;

  AddFreelancerMarketingServiceUseCase({
    required this.marketingServiceRepository,
  });

  Future<void> execute(MarketingService marketingService) async {
    try {
      return await marketingServiceRepository.addMarketingService(marketingService);
    } catch (e) {
      rethrow;
    }
  }
}
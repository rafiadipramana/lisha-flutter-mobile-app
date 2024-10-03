import 'package:lisha/app/domain/entities/marketing_service.dart';
import 'package:lisha/app/domain/repositories/marketing_service_repository.dart';

class UpdateFreelancerMarketingServiceUseCase {
  final MarketingServiceRepository marketingServiceRepository;

  UpdateFreelancerMarketingServiceUseCase({
    required this.marketingServiceRepository,
  });

  Future<void> execute(MarketingService marketingService) async {
    try {
      await marketingServiceRepository.updateMarketingService(marketingService);
    } catch (e) {
      rethrow;
    }
  }
}

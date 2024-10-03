import 'package:lisha/app/domain/entities/marketing_service.dart';
import 'package:lisha/app/domain/repositories/marketing_service_repository.dart';

class DeleteFreelancerMarketingServiceUseCase {
  final MarketingServiceRepository marketingServiceRepository;

  DeleteFreelancerMarketingServiceUseCase({
    required this.marketingServiceRepository,
  });

  Future<void> execute(MarketingService marketingService) async {
    try {
      await marketingServiceRepository.deleteMarketingService(marketingService);
    } catch (e) {
      rethrow;
    }
  }
}
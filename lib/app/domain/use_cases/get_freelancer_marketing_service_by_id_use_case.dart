import '../entities/marketing_service.dart';
import '../repositories/marketing_service_repository.dart';

class GetFreelancerMarketingServiceByIdUseCase {
  final MarketingServiceRepository marketingServiceRepository;

  GetFreelancerMarketingServiceByIdUseCase({
    required this.marketingServiceRepository,
  });

  Future<MarketingService> execute({
    required int marketingServiceId,
  }) async {
    try {
      return await marketingServiceRepository
          .getMarketingServiceById(marketingServiceId);
    } catch (e) {
      rethrow;
    }
  }
}

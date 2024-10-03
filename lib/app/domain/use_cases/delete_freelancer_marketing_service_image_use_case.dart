import 'package:lisha/app/domain/repositories/marketing_service_repository.dart';

class DeleteFreelancerMarketingServiceImageUseCase {
  final MarketingServiceRepository marketingServiceRepository;

  DeleteFreelancerMarketingServiceImageUseCase({
    required this.marketingServiceRepository,
  });

  Future<void> execute({
    required String userId,
    required String imageUrl,
  }) async {
    try {
      await marketingServiceRepository.deleteMarketingServiceImage(
        userId: userId,
        imageUrl: imageUrl,
      );
    } catch (e) {
      rethrow;
    }
  }
}

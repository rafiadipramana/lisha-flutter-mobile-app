import 'dart:io';

import 'package:lisha/app/domain/repositories/marketing_service_repository.dart';

class UploadFreelancerMarketingServiceImageUseCase {
  final MarketingServiceRepository marketingServiceRepository;

  UploadFreelancerMarketingServiceImageUseCase({
    required this.marketingServiceRepository,
  });

  Future<String> execute({
    required String userId,
    required File imageFile,
  }) async {
    try {
      return await marketingServiceRepository.uploadMarketingServiceImage(
        userId: userId,
        imageFile: imageFile,
      );
    } catch (e) {
      rethrow;
    }
  }
}
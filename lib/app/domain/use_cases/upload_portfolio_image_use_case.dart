import 'dart:io';
import '../repositories/portfolio_repository.dart';

class UploadPortfolioImageUseCase {
  final PortfolioRepository portfolioRepository;

  UploadPortfolioImageUseCase({
    required this.portfolioRepository,
  });

  Future<String> execute({
    required String userId,
    required File imageFile,
  }) async {
    try {
      return await portfolioRepository.uploadPortfolioImageAndGetDownloadUrl(
        userId: userId,
        imageFile: imageFile,
      );
    } catch (e) {
      rethrow;
    }
  }
}

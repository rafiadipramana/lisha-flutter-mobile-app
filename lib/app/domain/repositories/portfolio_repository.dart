import 'dart:io';
import '../entities/portfolio.dart';
import '../entities/portfolio_category.dart';

abstract class PortfolioRepository {
  Future<List<Portfolio>> getPortfolios();

  Future<Portfolio> getPortfolioById(int id);

  Future<List<PortfolioCategory>> getPortfolioCategories();

  Future<String> uploadPortfolioImageAndGetDownloadUrl({
    required String userId,
    required File imageFile,
  });

  Future<void> deletePortfolioImage({
    required String userId,
    required String imageUrl,
  });

  Future<void> addPortfolio(Portfolio portfolio);

  Future<void> updatePortfolio(Portfolio portfolio);

  Future<void> deletePortfolio(Portfolio portfolio);
}

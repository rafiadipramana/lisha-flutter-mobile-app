import 'dart:io';
import '../data_sources/remote/portfolio_remote_data_source.dart';
import '../mappers/portfolio_category_mapper.dart';
import '../mappers/portfolio_mapper.dart';
import '../../domain/entities/portfolio.dart';
import '../../domain/entities/portfolio_category.dart';
import '../../domain/repositories/portfolio_repository.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioRemoteDataSource portfolioRemoteDataSource;

  PortfolioRepositoryImpl({
    required this.portfolioRemoteDataSource,
  });

  @override
  Future<List<Portfolio>> getPortfolios() async {
    final portfolioModels = await portfolioRemoteDataSource.getPortfolios();
    return PortfolioMapper.fromModelList(portfolioModels);
  }

  @override
  Future<List<Portfolio>> getPortfoliosByFreelancerId() async {
    final portfolioModels = await portfolioRemoteDataSource.getPortfoliosByFreelancerId();
    return PortfolioMapper.fromModelList(portfolioModels);
  }

  @override
  Future<List<PortfolioCategory>> getPortfolioCategories() async {
    final portfolioCategoryModels =
        await portfolioRemoteDataSource.getPortfolioCategories();
    return PortfolioCategoryMapper.fromModelList(portfolioCategoryModels);
  }

  @override
  Future<String> uploadPortfolioImageAndGetDownloadUrl({
    required String userId,
    required File imageFile,
  }) async {
    return await portfolioRemoteDataSource
        .uploadPortfolioImageAndGetDownloadUrl(
      userId: userId,
      imageFile: imageFile,
    );
  }

  @override
  Future<void> addPortfolio(Portfolio portfolio) async {
    final portfolioModel = PortfolioMapper.fromEntity(portfolio);
    await portfolioRemoteDataSource.addPortfolio(portfolioModel);
  }

  @override
  Future<void> deletePortfolio(Portfolio portfolio) async {
    try {
      final portfolioModel = PortfolioMapper.fromEntity(portfolio);
      await portfolioRemoteDataSource.deletePortfolio(portfolioModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deletePortfolioImage({
    required String userId,
    required String imageUrl,
  }) async {
    try {
      return await portfolioRemoteDataSource.deletePortfolioImage(
        userId: userId,
        imageUrl: imageUrl,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Portfolio> getPortfolioById(int id) async {
    try {
      final portfolioModel = await portfolioRemoteDataSource.getPortfolioById(id);
      return PortfolioMapper.fromModel(portfolioModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updatePortfolio(Portfolio portfolio) async {
    try {
      final portfolioModel = PortfolioMapper.fromEntity(portfolio);
      await portfolioRemoteDataSource.updatePortfolio(portfolioModel);
    } catch (e) {
      rethrow;
    }
  }
}

import 'dart:io';

import 'package:lisha/app/data/data_sources/remote/marketing_service_remote_data_source.dart';
import 'package:lisha/app/data/mappers/marketing_service_mapper.dart';
import 'package:lisha/app/domain/entities/marketing_service.dart';
import 'package:lisha/app/domain/repositories/marketing_service_repository.dart';

class MarketingServiceRepositoryImpl implements MarketingServiceRepository {
  final MarketingServiceRemoteDataSource marketingServiceRemoteDataSource;

  MarketingServiceRepositoryImpl({
    required this.marketingServiceRemoteDataSource,
  });

  @override
  Future<void> addMarketingService(MarketingService marketingService) async {
    try {
      final marketingServiceModel =
          MarketingServiceMapper.fromEntity(marketingService);
      return await marketingServiceRemoteDataSource
          .addMarketingService(marketingServiceModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteMarketingService(MarketingService marketingService) async {
    try {
      final marketingServiceModel =
          MarketingServiceMapper.fromEntity(marketingService);
      return await marketingServiceRemoteDataSource
          .deleteMarketingService(marketingServiceModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MarketingService>> getMarketingServices() async {
    try {
      final marketingServiceModels =
          await marketingServiceRemoteDataSource.getMarketingServices();
      return MarketingServiceMapper.fromModelList(marketingServiceModels);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateMarketingService(MarketingService marketingService) async {
    try {
      final marketingServiceModel =
          MarketingServiceMapper.fromEntity(marketingService);
      return await marketingServiceRemoteDataSource
          .updateMarketingService(marketingServiceModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> uploadMarketingServiceImage({
    required String userId,
    required File imageFile,
  }) async {
    try {
      return await marketingServiceRemoteDataSource
          .uploadMarketingServiceImageAndGetDownloadUrl(
        userId: userId,
        imageFile: imageFile,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteMarketingServiceImage({
    required String userId,
    required String imageUrl,
  }) async {
    try {
      return await marketingServiceRemoteDataSource.deleteMarketingServiceImage(
        userId: userId,
        imageUrl: imageUrl,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MarketingService> getMarketingServiceById(int id) async {
    try {
      final marketingServiceModel =
          await marketingServiceRemoteDataSource.getMarketingServiceById(id);
      return MarketingServiceMapper.fromModel(marketingServiceModel);
    } catch (e) {
      rethrow;
    }
  }
}

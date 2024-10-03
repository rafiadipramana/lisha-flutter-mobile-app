import 'dart:io';
import '../entities/marketing_service.dart';

abstract class MarketingServiceRepository {
  Future<List<MarketingService>> getMarketingServices();
  Future<String> uploadMarketingServiceImage({required String userId, required File imageFile,});
  Future<void> deleteMarketingServiceImage({required String userId, required String imageUrl,});
  Future<MarketingService> getMarketingServiceById(int id);
  Future<void> addMarketingService(MarketingService marketingService);
  Future<void> updateMarketingService(MarketingService marketingService);
  Future<void> deleteMarketingService(MarketingService marketingService);
}
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/marketing_service_model.dart';
import '../../../extensions/file_path/file_path_extension.dart';
import '../../../extensions/url_path/string_url_path_extension.dart';
import '../../../config/app_constants.dart';

class MarketingServiceRemoteDataSource {
  final SupabaseClient client;

  MarketingServiceRemoteDataSource() : client = Supabase.instance.client;

  Future<List<MarketingServiceModel>> getMarketingServices() async {
    try {
      final response = await client.from('marketing_service').select();
      return response.map((e) => MarketingServiceModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> uploadMarketingServiceImageAndGetDownloadUrl({
    required String userId,
    required File imageFile,
  }) async {
    try {
      final String uploadPath = '$userId/${imageFile.fileName}';
      const FileOptions fileOptions = FileOptions(
        cacheControl: '3600',
        upsert: true,
      );
      return await client.storage
          .from(AppConstants.marketingServiceImageBucketName)
          .upload(uploadPath, imageFile, fileOptions: fileOptions);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteMarketingServiceImage({
    required String userId,
    required String imageUrl,
  }) async {
    try {
      final String deletePath = '$userId/${imageUrl.fileName}';
      await client.storage
          .from(AppConstants.marketingServiceImageBucketName)
          .remove(
        [deletePath],
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<MarketingServiceModel> getMarketingServiceById(int id) async {
    try {
      final response =
          await client.from('marketing_service').select().eq('id', id);
      return MarketingServiceModel.fromJson(response.first);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addMarketingService(
      MarketingServiceModel marketingService) async {
    try {
      await client.from('marketing_service').insert(marketingService.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateMarketingService(
      MarketingServiceModel marketingService) async {
    try {
      await client
          .from('marketing_service')
          .update(marketingService.toJson())
          .eq('id', marketingService.id!);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteMarketingService(
      MarketingServiceModel marketingService) async {
    try {
      await client
          .from('marketing_service')
          .delete()
          .eq('id', marketingService.id!);
    } catch (e) {
      rethrow;
    }
  }
}

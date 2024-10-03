import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../config/app_constants.dart';
import '../../models/portfolio_model.dart';
import '../../../extensions/file_path/file_path_extension.dart';
import '../../../extensions/url_path/string_url_path_extension.dart';
import '../../models/portfolio_category_model.dart';

class PortfolioRemoteDataSource {
  final SupabaseClient client;

  PortfolioRemoteDataSource() : client = Supabase.instance.client;

  Future<List<PortfolioModel>> getPortfolios() async {
    try {
      final response = await client.from('portfolio').select('''
      id,
      title,
      description,
      image_url,
      category:category_id (*)
      ''');
      return response.map((e) => PortfolioModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<PortfolioModel> getPortfolioById(int id) async {
    try {
      final response = await client.from('portfolio').select('''
      id,
      title,
      description,
      image_url,
      category:category_id (*)
      ''').eq('id', id);
      return PortfolioModel.fromJson(response.first);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PortfolioCategoryModel>> getPortfolioCategories() async {
    try {
      final response = await client.from('portfolio_category').select();
      return response.map((e) => PortfolioCategoryModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> uploadPortfolioImageAndGetDownloadUrl({
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
          .from(AppConstants.portfolioImageBucketName)
          .upload(uploadPath, imageFile, fileOptions: fileOptions);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deletePortfolioImage({
    required String userId,
    required String imageUrl,
  }) async {
    try {
      final String deletePath = '$userId/${imageUrl.fileName}';
      await client.storage.from(AppConstants.portfolioImageBucketName).remove(
        [deletePath],
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addPortfolio(PortfolioModel portfolio) async {
    try {
      await client.from('portfolio').insert(portfolio.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePortfolio(PortfolioModel portfolioModel) async {
    try {
      await client
          .from('portfolio')
          .update(portfolioModel.toJson())
          .eq('id', portfolioModel.id!);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deletePortfolio(PortfolioModel portfolioModel) async {
    try {
      await client.from('portfolio').delete().eq('id', portfolioModel.id!);
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:lisha/app/config/app_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static SupabaseClient get client => Supabase.instance.client;

  static String? get userId => client.auth.currentUser?.id;
  static String get mainUserId => '6cbcab48-5b3e-4276-b4ff-9abedcb0d8f1';

  static String getPortfolioImageDownloadUrl(String fileName) => client.storage
      .from('${AppConstants.portfolioImageBucketName}/$userId')
      .getPublicUrl(fileName);

  static String getMarketingServiceImageDownloadUrl(String fileName) => client.storage
      .from('${AppConstants.marketingServiceImageBucketName}/$userId')
      .getPublicUrl(fileName);
}

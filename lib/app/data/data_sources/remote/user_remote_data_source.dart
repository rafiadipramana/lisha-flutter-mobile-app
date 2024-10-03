import 'package:supabase_flutter/supabase_flutter.dart';

class UserRemoteDataSource {
  final SupabaseClient client;

  UserRemoteDataSource() : client = Supabase.instance.client;

  User? getCurrentUser() {
    try {
      final user = client.auth.currentUser;
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Session? checkCurrentSession() {
    try {
      final session = client.auth.currentSession;
      return session;
    } catch (e) {
      rethrow;
    }
  }
}
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../models/auth_model.dart';

class AuthRemoteDataSource {
  final SupabaseClient client;

  AuthRemoteDataSource() : client = Supabase.instance.client;

  Future<AuthResponse> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> signUp({
    required String? username,
    required String? email,
    required String firstName,
    required String lastName,
    required String country,
    required String password,
  }) async {
    try {
      final userModel = AuthModel(
        firstName: firstName,
        lastName: lastName,
        country: country,
      );
      final response = await client.auth.signUp(
        email: email,
        password: password,
        data: userModel.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await client.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resetPasswordByEmail({required String email}) async {
    try {
      await client.auth.resetPasswordForEmail(email);
      print('Password reset email sent to $email');
    } catch (e) {
      rethrow;
    }
  }
}

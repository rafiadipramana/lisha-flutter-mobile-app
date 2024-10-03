import 'package:lisha/app/data/data_sources/remote/auth_remote_data_source.dart';

import '../../domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
  });

  @override
  Future<AuthResponse> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authRemoteDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() {
    try {
      return authRemoteDataSource.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthResponse> signUp({
    String? email,
    String? username,
    required String firstName,
    required String lastName,
    required String password,
    required String country,
  }) {
    try {
      return authRemoteDataSource.signUp(
        email: email,
        username: username,
        firstName: firstName,
        lastName: lastName,
        password: password,
        country: country,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> resetPasswordByEmail({required String email}) async {
    try {
      await authRemoteDataSource.resetPasswordByEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }
}

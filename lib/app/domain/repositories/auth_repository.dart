import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<AuthResponse> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<AuthResponse> signUp({
    String? email,
    String? username,
    required String firstName,
    required String lastName,
    required String password,
    required String country,
  });

  Future<void> logout();

  Future<void> resetPasswordByEmail({required String email});
}

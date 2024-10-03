import 'package:supabase_flutter/supabase_flutter.dart';

import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({
    required this.authRepository,
  });

  Future<AuthResponse> execute({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

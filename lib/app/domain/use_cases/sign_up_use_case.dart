import 'package:supabase_flutter/supabase_flutter.dart';

import '../repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository authRepository;

  SignUpUseCase({
    required this.authRepository,
  });

  Future<AuthResponse> execute({
    String? email,
    String? username,
    required String firstName,
    required String lastName,
    required String password,
    required String country,
  }) async {
    try {
      final response = await authRepository.signUp(
        email: email,
        username: username,
        firstName: firstName,
        lastName: lastName,
        password: password,
        country: country,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

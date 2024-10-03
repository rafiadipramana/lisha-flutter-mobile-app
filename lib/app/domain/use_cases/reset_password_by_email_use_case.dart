import 'package:lisha/app/domain/repositories/auth_repository.dart';

class ResetPasswordByEmailUseCase {
  final AuthRepository authRepository;

  ResetPasswordByEmailUseCase({
    required this.authRepository,
  });

  Future<void> execute({required String email}) async {
    try {
      return authRepository.resetPasswordByEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }
}
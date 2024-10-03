import '../repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository authRepository;

  LogoutUseCase({
    required this.authRepository,
  });

  Future<void> execute() async {
    try {
      await authRepository.logout();
    } catch (e) {
      rethrow;
    }
  }
}

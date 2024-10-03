import 'package:lisha/app/domain/repositories/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetUserDataUseCase {
  final UserRepository userRepository;

  GetUserDataUseCase({
    required this.userRepository,
  });

  User? execute() {
    return userRepository.getCurrentUser();
  }
}

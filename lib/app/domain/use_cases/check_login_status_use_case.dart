import 'package:lisha/app/domain/repositories/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class CheckLoginStatusUsecase {
  final UserRepository userRepository;

  CheckLoginStatusUsecase({
    required this.userRepository,
  });

  Session? execute() {
    return userRepository.checkCurrentSession();
  }
}

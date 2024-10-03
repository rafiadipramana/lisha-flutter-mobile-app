import 'package:lisha/app/data/data_sources/remote/user_remote_data_source.dart';
import 'package:lisha/app/domain/repositories/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({
    required this.userRemoteDataSource,
  });

  @override
  Session? checkCurrentSession() {
    try {
      final session = userRemoteDataSource.checkCurrentSession();
      return session;
    } catch (e) {
      rethrow;
    }
  }

  @override
  User? getCurrentUser() {
    try {
      final user = userRemoteDataSource.getCurrentUser();
      return user;
    } catch (e) {
      rethrow;
    }
  }

}
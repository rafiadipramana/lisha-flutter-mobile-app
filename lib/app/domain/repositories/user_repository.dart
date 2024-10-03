import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserRepository {
  User? getCurrentUser();
  Session? checkCurrentSession();
}
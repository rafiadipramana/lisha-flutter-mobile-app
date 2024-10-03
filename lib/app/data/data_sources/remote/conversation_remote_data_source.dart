import 'package:lisha/app/data/models/conversation_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ConversationRemoteDataSource {
  final SupabaseClient client;

  ConversationRemoteDataSource() : client = Supabase.instance.client;

  Stream<List<ConversationModel>> getConversations() {
    try {
      return client.from('conversation').stream(primaryKey: ['id']).map((event) {
        return event.map((e) => ConversationModel.fromJson(e)).toList();
      });
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:lisha/app/data/models/chat_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatRemoteDataSource {
  final SupabaseClient client;

  ChatRemoteDataSource() : client = Supabase.instance.client;

  Stream<List<ChatModel>> getChatsByConversationId({
    required String conversationId,
  }) {
    try {
      return client
          .from('chat')
          .stream(primaryKey: ['id'])
          .eq(
            'conversation_id',
            conversationId,
          )
          .map(
            (response) {
              return response.map((e) => ChatModel.fromJson(e)).toList();
            },
          );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendChat({
    required ChatModel message,
  }) async {
    try {
      await client.from('chat').insert(
            message.toJson(),
          );
    } catch (e) {
      rethrow;
    }
  }
}

import 'dart:developer';

import 'package:lisha/app/data/models/conversation_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ConversationRemoteDataSource {
  final SupabaseClient client;

  ConversationRemoteDataSource() : client = Supabase.instance.client;

  Stream<List<ConversationModel>> getConversations() {
    log('Current User ID: ${client.auth.currentUser!.id}');
    try {
      return client
          .from('conversation')
          .stream(primaryKey: ['id']).map((event) {
        return event
            .where((e) => (e['member_list'] as List)
                .contains(client.auth.currentUser!.id))
            .map((e) => ConversationModel.fromJson(e))
            .toList();
      });
    } catch (e) {
      rethrow;
    }
  }
}

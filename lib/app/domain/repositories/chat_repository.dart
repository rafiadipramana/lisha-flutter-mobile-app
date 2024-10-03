import 'package:lisha/app/domain/entities/chat.dart';

abstract class ChatRepository {
  Stream<List<Chat>> getChatsByConversationId({required String conversationId});
  Future<void> sendChat({required Chat chat});
}
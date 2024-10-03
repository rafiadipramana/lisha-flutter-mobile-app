import '../entities/conversation.dart';

abstract class ConversationRepository {
  Stream<List<Conversation>> getConversations();
}
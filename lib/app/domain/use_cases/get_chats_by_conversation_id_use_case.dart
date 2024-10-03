import '../repositories/chat_repository.dart';
import '../entities/chat.dart';

class GetChatsByConversationIdUseCase {
  final ChatRepository chatRepository;

  GetChatsByConversationIdUseCase({
    required this.chatRepository,
  });

  Stream<List<Chat>> execute({required String conversationId}) {
    try {
      return chatRepository.getChatsByConversationId(
        conversationId: conversationId,
      );
    } catch (e) {
      rethrow;
    }
  }
}

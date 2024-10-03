import 'package:lisha/app/domain/entities/conversation.dart';
import 'package:lisha/app/domain/repositories/conversation_repository.dart';

class GetConversationUseCase {
  final ConversationRepository conversationRepository;

  GetConversationUseCase({
    required this.conversationRepository,
  });

  Stream<List<Conversation>> execute() {
    try {
      return conversationRepository.getConversations();
    } catch (e) {
      rethrow;
    }
  }
}
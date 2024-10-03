import '../entities/chat.dart';
import '../repositories/chat_repository.dart';

class AddChatUseCase {
  final ChatRepository chatRepository;

  AddChatUseCase({
    required this.chatRepository,
  });

  Future<void> execute({
    required Chat chat,
  }) async {
    try {
      await chatRepository.sendChat(chat: chat);
    } catch (e) {
      rethrow;
    }
  }
}

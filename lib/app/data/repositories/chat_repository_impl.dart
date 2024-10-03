import 'package:lisha/app/data/data_sources/remote/chat_remote_data_source.dart';
import 'package:lisha/app/data/mappers/chat_mapper.dart';
import 'package:lisha/app/domain/entities/chat.dart';
import 'package:lisha/app/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource chatRemoteDataSource;

  ChatRepositoryImpl({
    required this.chatRemoteDataSource,
  });

  @override
  Stream<List<Chat>> getChatsByConversationId({
    required String conversationId,
  }) {
    try {
      final stream = chatRemoteDataSource.getChatsByConversationId(
        conversationId: conversationId,
      );
      return stream.map((event) => ChatMapper.fromModelList(event));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendChat({required Chat chat}) async {
    try {
      final model = ChatMapper.fromEntity(chat);
      return await chatRemoteDataSource.sendChat(message: model);
    } catch (e) {
      rethrow;
    }
  }
}

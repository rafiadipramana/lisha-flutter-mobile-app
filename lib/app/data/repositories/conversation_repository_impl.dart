import 'package:lisha/app/data/data_sources/remote/conversation_remote_data_source.dart';
import 'package:lisha/app/data/mappers/conversation_mapper.dart';
import 'package:lisha/app/domain/entities/conversation.dart';
import 'package:lisha/app/domain/repositories/conversation_repository.dart';

class ConversationRepositoryImpl implements ConversationRepository {
  final ConversationRemoteDataSource conversationRemoteDataSource;

  ConversationRepositoryImpl({
    required this.conversationRemoteDataSource,
  });

  @override
  Stream<List<Conversation>> getConversations() {
    try {
      final conversationModels = conversationRemoteDataSource.getConversations();
      return conversationModels.map((event) => event.map((e) => ConversationMapper.fromModel(e)).toList());
    } catch (e) {
      rethrow;
    }
  }
}

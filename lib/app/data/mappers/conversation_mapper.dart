import 'package:lisha/app/data/models/conversation_model.dart';
import 'package:lisha/app/domain/entities/conversation.dart';

class ConversationMapper {
  static Conversation fromModel(ConversationModel model) {
    return Conversation(
      id: model.id,
      name: model.name,
      type: model.type,
      memberList: model.memberList,
      lastMessage: model.lastMessage,
      createdAt: model.createdAt,
    );
  }

  static ConversationModel fromEntity(Conversation entity) {
    return ConversationModel(
      id: entity.id,
      name: entity.name,
      type: entity.type,
      memberList: entity.memberList,
      lastMessage: entity.lastMessage,
      createdAt: entity.createdAt,
    );
  }

  static List<Conversation> fromModelList(List<ConversationModel> models) {
    return models.map((e) => fromModel(e)).toList();
  }

  static List<ConversationModel> fromEntityList(List<Conversation> entities) {
    return entities.map((e) => fromEntity(e)).toList();
  }
}
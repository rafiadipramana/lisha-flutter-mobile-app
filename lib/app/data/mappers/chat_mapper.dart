import 'package:lisha/app/data/mappers/chat_attachment_mapper.dart';
import 'package:lisha/app/data/models/chat_model.dart';
import 'package:lisha/app/domain/entities/chat.dart';

class ChatMapper {
  static Chat fromModel(ChatModel model) {
    return Chat(
      id: model.id,
      conversationId: model.conversationId,
      senderId: model.senderId,
      message: model.message,
      attachment: model.attachment != null
          ? ChatAttachmentMapper.fromModel(model.attachment!)
          : null,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  static ChatModel fromEntity(Chat entity) {
    return ChatModel(
      id: entity.id,
      conversationId: entity.conversationId,
      senderId: entity.senderId,
      message: entity.message,
      attachment: entity.attachment != null
          ? ChatAttachmentMapper.fromEntity(entity.attachment!)
          : null,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  static List<Chat> fromModelList(List<ChatModel> models) {
    return models.map(fromModel).toList();
  }

  static List<ChatModel> fromEntityList(List<Chat> entities) {
    return entities.map(fromEntity).toList();
  }
}

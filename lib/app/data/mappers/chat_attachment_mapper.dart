import 'package:lisha/app/data/models/chat_attachment_model.dart';
import 'package:lisha/app/domain/entities/chat_attachment.dart';

class ChatAttachmentMapper {
  static ChatAttachment fromModel(ChatAttachmentModel model) {
    return ChatAttachment(
      type: model.type ,
      url: model.url,
    );
  }

  static ChatAttachmentModel fromEntity(ChatAttachment entity) {
    return ChatAttachmentModel(
      type: entity.type,
      url: entity.url,
    );
  }

  static List<ChatAttachment> fromModelList(List<ChatAttachmentModel> models) {
    return models.map(fromModel).toList();
  }

  static List<ChatAttachmentModel> fromEntityList(List<ChatAttachment> entities) {
    return entities.map(fromEntity).toList();
  }
}
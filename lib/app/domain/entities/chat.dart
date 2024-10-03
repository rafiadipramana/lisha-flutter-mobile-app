import 'chat_attachment.dart';

class Chat {
  final String? id;
  final String conversationId;
  final String? senderId;
  final String message;
  final ChatAttachment? attachment;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Chat({
    this.id,
    required this.conversationId,
    this.senderId,
    required this.message,
    this.attachment,
    this.createdAt,
    this.updatedAt,
  });
}
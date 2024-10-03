import 'package:lisha/app/data/models/chat_attachment_model.dart';

class ChatModel {
  final String? id;
  final String conversationId;
  final String? senderId;
  final String message;
  final ChatAttachmentModel? attachment;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ChatModel({
    this.id,
    required this.conversationId,
    this.senderId,
    required this.message,
    this.attachment,
    this.createdAt,
    this.updatedAt,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      conversationId: json['conversation_id'],
      senderId: json['sender_id'],
      message: json['message'],
      attachment: json['attachment'] != null
          ? ChatAttachmentModel.fromJson(json['attachment'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'conversation_id': conversationId,
      if (senderId != null) 'sender_id': senderId,
      'message': message,
      if (attachment != null) 'attachment': attachment!.toJson(),
      if (createdAt != null) 'created_at': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt!.toIso8601String(),
    };
  }
}
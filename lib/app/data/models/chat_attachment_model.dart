class ChatAttachmentModel {
  final String type;
  final String url;

  ChatAttachmentModel({
    required this.type,
    required this.url,
  });

  factory ChatAttachmentModel.fromJson(Map<String, dynamic> json) {
    return ChatAttachmentModel(
      type: json['type'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'url': url,
    };
  }
}
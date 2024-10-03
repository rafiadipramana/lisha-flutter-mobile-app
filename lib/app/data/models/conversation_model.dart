class ConversationModel {
  final String id;
  final String? name;
  final String? type;
  final List<String> memberList;
  final Map<String, dynamic>? lastMessage;
  final DateTime createdAt;

  ConversationModel({
    required this.id,
    this.name,
    this.type,
    required this.memberList,
    this.lastMessage,
    required this.createdAt,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      memberList: List<String>.from(json['member_list']),
      lastMessage: json['last_message'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
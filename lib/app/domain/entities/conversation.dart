class Conversation {
  final String id;
  final String? name;
  final String? type;
  final List<String> memberList;
  final Map<String, dynamic>? lastMessage;
  final DateTime createdAt;

  Conversation({
    required this.id,
    this.name,
    this.type,
    required this.memberList,
    this.lastMessage,
    required this.createdAt,
  });
}
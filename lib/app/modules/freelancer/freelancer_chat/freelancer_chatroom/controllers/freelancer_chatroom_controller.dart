import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lisha/app/domain/entities/chat.dart';
import 'package:lisha/app/domain/entities/conversation.dart';
import 'package:lisha/app/domain/use_cases/get_chats_by_conversation_id_use_case.dart';

import '../../../../../domain/use_cases/add_chat_use_case.dart';

class FreelancerChatroomController extends GetxController {
  late final DraggableScrollableController _draggableScrollableController;

  DraggableScrollableController get draggableScrollableController =>
      _draggableScrollableController;

  final RxDouble _fractionalScrollPosition = 0.0.obs;

  double get fractionalScrollPosition => _fractionalScrollPosition.value;

  late final TextEditingController _messageController;

  TextEditingController get messageController => _messageController;

  late final Rxn<Conversation> _conversation;

  Conversation? get conversation => _conversation.value;

  final RxList<Chat> _chats = <Chat>[].obs;

  List<Chat> get chats => _chats;

  @override
  void onInit() {
    _draggableScrollableController = DraggableScrollableController();
    _draggableScrollableController.addListener(() {
      _fractionalScrollPosition.value =
          _draggableScrollableController.pixelsToSize(
        _draggableScrollableController.pixels,
      );
    });
    _messageController = TextEditingController();
    _conversation = Rxn<Conversation>();
    _conversation.value = Get.arguments as Conversation;
    _chats.bindStream(Get.find<GetChatsByConversationIdUseCase>().execute(
      conversationId: _conversation.value!.id,
    ));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> addChat() async {
    if (_messageController.text.isNotEmpty) {
      try {
        final addChat = Get.find<AddChatUseCase>();
        await addChat.execute(
          chat: Chat(
            conversationId: conversation!.id,
            message: _messageController.text,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        );
      } catch (e) {
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
        throw e;
      } finally {
        if (_messageController.text.isNotEmpty) {
          _messageController.clear();
        }
      }
    }
  }

  @override
  void onClose() {
    _messageController.dispose();
    super.onClose();
  }
}

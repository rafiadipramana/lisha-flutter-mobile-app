import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:get/get.dart';
import 'package:lisha/app/domain/entities/conversation.dart';
import 'package:lisha/app/routes/app_pages.dart';

import '../../../../domain/use_cases/get_conversation_use_case.dart';

class FreelancerChatController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController _tabController;

  TabController get tabController => _tabController;

  late final RxInt _currentTab;

  int get currentTab => _currentTab.value;

  late final PageController _backgroundPageController;

  PageController get backgroundPageController => _backgroundPageController;

  late final PageController _chatPageController;

  PageController get chatPageController => _chatPageController;

  late final SwipeActionController _swipeActionController;

  SwipeActionController get swipeActionController => _swipeActionController;

  late final RxList<Conversation> _conversations;

  List<Conversation> get conversations => _conversations;

  @override
  void onInit() {
    _currentTab = 0.obs;
    _tabController = TabController(
      initialIndex: _currentTab.value,
      length: 3,
      vsync: this,
    );
    _backgroundPageController = PageController(
      initialPage: _currentTab.value,
    );
    _chatPageController = PageController(
      initialPage: _currentTab.value,
    );
    _tabController.addListener(
      () {
        _currentTab.value = _tabController.index;
        _backgroundPageController.jumpToPage(_currentTab.value);
        _chatPageController.jumpToPage(_currentTab.value);
      },
    );
    _swipeActionController = SwipeActionController();

    _conversations = <Conversation>[].obs;
    _conversations.bindStream(
      Get.find<GetConversationUseCase>().execute(),
    );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _tabController.dispose();
    _backgroundPageController.dispose();
    _chatPageController.dispose();
    super.onClose();
  }

  void handlePageChange(int index) {
    _tabController.animateTo(index);
    _backgroundPageController.jumpToPage(index);
  }

  void handleOpenActionCell(int index) {
    _swipeActionController.openCellAt(
        index: index, trailing: true, animated: true);
  }

  void navigateToChatroom({
    required Conversation conversation,
  }) {
    Get.toNamed(
      Routes.FREELANCER_CHATROOM,
      arguments: conversation,
    );
  }
}

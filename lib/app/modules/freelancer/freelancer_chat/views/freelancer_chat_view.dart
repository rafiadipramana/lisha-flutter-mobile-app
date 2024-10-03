import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lisha/app/config/app_assets.dart';
import 'package:lisha/app/config/app_colors.dart';
import 'package:lisha/app/domain/entities/conversation.dart';
import 'package:lisha/app/extensions/text_styles/int_text_style_extension.dart';
import 'package:lisha/app/modules/freelancer/freelancer_chat/controllers/freelancer_chat_controller.dart';
import 'package:lisha/app/util/date_time_formatter_util.dart';
import 'package:tab_container/tab_container.dart';

class FreelancerChatView extends GetView<FreelancerChatController> {
  const FreelancerChatView({super.key});

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Stack(
      children: <Widget>[
        /// Background
        Material(
          child: PageView(
            controller: controller.backgroundPageController,
            children: [
              Ink.image(
                image: const AssetImage(
                  AppAssets.recentsChatBackground,
                ),
                fit: BoxFit.cover,
              ),
              Ink.image(
                image: const AssetImage(
                  AppAssets.favoritesChatBackground,
                ),
                fit: BoxFit.cover,
              ),
              Ink.image(
                image: const AssetImage(
                  AppAssets.groupsChatBackground,
                ),
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),

        Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size(
              double.infinity,
              kToolbarHeight + 13,
            ),
            child: Stack(
              children: <Widget>[
                AppBar(
                  backgroundColor: AppColors.primary,
                ),
                Material(
                  type: MaterialType.transparency,
                  child: Ink(
                    color: AppColors.primary,
                    padding: EdgeInsets.only(
                      left: 24,
                      top: paddingTop + 13,
                      right: 24,
                      bottom: 13,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(100),
                          child: Ink(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                              border: Border.all(
                                color: AppColors.white,
                              ),
                            ),
                            child: const Icon(
                              Icons.add_rounded,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(100),
                          child: Ink(
                            padding: const EdgeInsets.all(8),
                            child: SvgPicture.asset(
                              AppAssets.searchIcon,
                              width: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              TabContainer(
                controller: controller.tabController,
                tabEdge: TabEdge.bottom,
                curve: Curves.easeIn,
                transitionBuilder: (child, animation) {
                  animation = CurvedAnimation(
                    curve: Curves.easeIn,
                    parent: animation,
                  );
                  return SlideTransition(
                    position: Tween(
                      begin: const Offset(0.2, 0.0),
                      end: const Offset(0.0, 0.0),
                    ).animate(animation),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
                borderRadius: const BorderRadius.all(Radius.zero),
                tabBorderRadius: BorderRadius.circular(30),
                color: AppColors.primary,
                tabs: [
                  Text(
                    'Recents',
                    style: 16.0.medium,
                  ),
                  Text(
                    'Favorites',
                    style: 16.0.medium,
                  ),
                  Text(
                    'Groups',
                    style: 16.0.medium,
                  ),
                ],
                child: Container(),
              ),
              Expanded(
                child: PageView(
                  controller: controller.chatPageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Obx(
                      () => buildListView(
                        conversations: controller.conversations,
                      ),
                    ),
                    Obx(
                      () => buildListView(
                        conversations: controller.conversations,
                      ),
                    ),
                    Obx(
                      () => buildListView(
                        conversations: controller.conversations,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ListView buildListView({
    required List<Conversation> conversations,
  }) {
    return ListView.builder(
      itemCount: controller.conversations.length,
      padding: const EdgeInsets.only(top: 32),
      itemBuilder: (_, index) {
        return ConversationListTile(
          conversation: conversations[index],
          swipeActionController: controller.swipeActionController,
          onTap: () {
            controller.navigateToChatroom(
              conversation: conversations[index],
            );
          },
        );
      },
    );
  }
}

class ConversationListTile extends StatelessWidget {
  final Conversation conversation;
  final SwipeActionController swipeActionController;
  final Function()? onTap;

  const ConversationListTile({
    super.key,
    required this.conversation,
    required this.swipeActionController,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    /// Default onTap is empty function
    onTap ?? () {};

    return SwipeActionCell(
      key: ValueKey(conversation.id),
      backgroundColor: AppColors.transparent,
      controller: swipeActionController,
      trailingActions: [
        SwipeAction(
          widthSpace: 120,
          performsFirstActionWithFullSwipe: false,
          onTap: (result) {
            /// Delete conversation
          },
          color: AppColors.transparent,
          content: AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.delete_rounded,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
      child: InkWell(
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
          child: Row(
            children: <Widget>[
              const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(
                  AppAssets.profilePictureDummy,
                ),
              ),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          conversation.name ?? 'Temporary name',
                          style: 16.0.medium,
                        ),
                        if (conversation.lastMessage?['created_at'] != null)
                          Text(
                            DateTimeFormatterUtil.convertDateTimeStringToTime(
                              conversation.lastMessage?['created_at'],
                            ),
                            style: 12.0.regular.copyWith(
                                  color: AppColors.grey,
                                ),
                          ),
                      ],
                    ),
                    const Gap(6),
                    Text(
                      conversation.lastMessage?['message'] ??
                          'Temporary message',
                      style: 14.0.regular.copyWith(
                            color: AppColors.grey,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CurvedRightSideTabIndicator extends Decoration {
//   final Color color;
//
//   CurvedRightSideTabIndicator({required this.color});
//
//   @override
//   BoxPainter createBoxPainter([VoidCallback? onChanged]) {
//     return _CurvedRightSidePainter(color: color);
//   }
// }
//
// class _CurvedRightSidePainter extends BoxPainter {
//   final Color color;
//
//   _CurvedRightSidePainter({required this.color});
//
//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
//     final Paint paint = Paint()
//       ..color = color
//       ..style = PaintingStyle.fill;
//
//     final Rect rect = offset & configuration.size!;
//     final Path path = Path();
//
//     // Mulai dari kiri bawah
//     path.moveTo(rect.left, rect.bottom);
//
//     // Gambar garis lurus ke kiri atas
//     path.lineTo(rect.left, rect.top);
//
//     // Gambar garis lurus ke kanan atas
//     path.lineTo(rect.right, rect.top);
//
//     // Buat kurva S yang halus di sisi kanan
//     path.cubicTo(
//         rect.right - rect.width * 0.3, rect.top + rect.height * 0.3,  // Titik kontrol kedua
//         rect.right, rect.top + rect.height * 0.7,  // Titik kontrol pertama
//         rect.right - rect.width * 0.35, rect.bottom  // Titik akhir
//     );
//
//     // Tutup path
//     path.close();
//
//     // Gambar path pada canvas
//     canvas.drawPath(path, paint);
//   }
// }

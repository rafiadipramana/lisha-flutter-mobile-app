import 'dart:io';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lisha/app/config/app_assets.dart';
import 'package:lisha/app/config/app_colors.dart';
import 'package:lisha/app/data/services/supabase_service.dart';
import 'package:lisha/app/extensions/text_styles/int_text_style_extension.dart';
import 'package:lisha/app/modules/freelancer/freelancer_chat/freelancer_chatroom/controllers/freelancer_chatroom_controller.dart';

class FreelancerChatroomView extends GetView<FreelancerChatroomController> {
  const FreelancerChatroomView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Obx(
            () {
              final progress = controller.fractionalScrollPosition > 0.65
                  ? (controller.fractionalScrollPosition - 0.65) / 0.35
                  : 0.0;

              final opacity = 1.0 - progress;

              return AnimatedOpacity(
                duration: const Duration(seconds: 0),
                opacity: opacity,
                child: Ink(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(AppAssets.chatHeaderBackground),
                      fit: BoxFit.cover,
                      opacity: opacity,
                    ),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(40),
                    ),
                  ),
                  height: size.height * 0.35 - 10,
                  child: Column(
                    children: <Widget>[
                      Gap(paddingTop),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Ink(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white.withOpacity(0.1),
                            ),
                            child: const Icon(
                              Icons.call,
                            ),
                          ),
                          const Gap(16),
                          Ink(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white.withOpacity(0.1),
                            ),
                            child: const Icon(
                              Icons.videocam_rounded,
                            ),
                          ),
                          const Gap(16),
                          Ink(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white.withOpacity(0.1),
                            ),
                            child: const Icon(
                              Icons.file_copy_rounded,
                            ),
                          ),
                          const Gap(16),
                          Ink(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white.withOpacity(0.1),
                            ),
                            child: const Icon(
                              Icons.sunny,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                AppAssets.profilePictureDummy,
                              ),
                            ),
                            const Gap(8),
                            Text(
                              controller.conversation?.name ?? 'Unknown',
                              style: 20.0.medium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: size.height,
            width: size.width,
            child: DraggableScrollableSheet(
              controller: controller.draggableScrollableController,
              initialChildSize: 0.65,
              minChildSize: 0.65,
              maxChildSize: 1 - (paddingTop / size.height),
              snap: true,
              builder: (context, scrollController) {
                return Material(
                  type: MaterialType.transparency,
                  child: Ink(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.draggableBackground),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Obx(
                          () {
                            final double progress =
                                controller.fractionalScrollPosition > 0.65
                                    ? (controller.fractionalScrollPosition -
                                            0.65) /
                                        0.30
                                    : 0.0;

                            final double opacity = 1.0 - progress;

                            return Ink(
                              height: 8,
                              width: 60,
                              decoration: BoxDecoration(
                                color: AppColors.grey200.withOpacity(opacity),
                                borderRadius: BorderRadius.circular(32),
                              ),
                            );
                          },
                        ),
                        Obx(() {
                          final scale = controller.fractionalScrollPosition >
                                  0.65
                              ? (controller.fractionalScrollPosition - 0.65) /
                                  0.35
                              : 0.0;

                          final size = 80 * scale;

                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 0),
                            height: size, // Use calculated size for height
                            width: size, // Use calculated size for width
                            child: Transform.scale(
                              scale: scale,
                              child: const CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(
                                  AppAssets.profilePictureDummy,
                                ),
                              ),
                            ),
                          );
                        }),
                        Expanded(
                          child: Obx(
                            () {
                              return ListView.builder(
                                controller: scrollController,
                                padding: const EdgeInsets.only(top: 24),
                                itemCount: controller.chats.length,
                                itemBuilder: (context, index) {
                                  final chat = controller.chats[index];
                                  return ChatBubble(
                                    message: chat.message,
                                    dateTime: chat.updatedAt!,
                                    isSender:
                                        chat.senderId == SupabaseService.userId,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Ink(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(100),
                                child: Ink(
                                  padding: const EdgeInsets.all(15),
                                  decoration: const ShapeDecoration(
                                    color: AppColors.white,
                                    shape: CircleBorder(),
                                  ),
                                  child: SvgPicture.asset(
                                    AppAssets.emojiIcon,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: controller.messageController,
                                  minLines: 1,
                                  maxLines: 3,
                                  style: 16.0.regular.copyWith(
                                        color: AppColors.black,
                                      ),
                                  decoration: InputDecoration(
                                    hintText: 'Type a message',
                                    hintStyle: 16.0.regular.copyWith(
                                          color: AppColors.grey200,
                                        ),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(100),
                                    child: Ink(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const ShapeDecoration(
                                        shape: CircleBorder(),
                                      ),
                                      child: SvgPicture.asset(
                                        AppAssets.attachmentIcon,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(100),
                                    child: Ink(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const ShapeDecoration(
                                        shape: CircleBorder(),
                                      ),
                                      child: SvgPicture.asset(
                                        AppAssets.audioIcon,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(8),
                              InkWell(
                                onTap: controller.addChat,
                                borderRadius: BorderRadius.circular(100),
                                child: Ink(
                                  padding: const EdgeInsets.all(15),
                                  decoration: const ShapeDecoration(
                                    color: AppColors.primary,
                                    shape: CircleBorder(),
                                  ),
                                  child: SvgPicture.asset(
                                    AppAssets.sendIcon,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Offstage(
            offstage: true,
            child: EmojiPicker(
              customWidget: (config, state, showSearchBar) => AppEmojiPicker(
                  config, state, showSearchBar, controller.messageController),
              config: Config(
                height: 256,
                checkPlatformCompatibility: true,
                emojiViewConfig: EmojiViewConfig(
                  columns: 6,
                  backgroundColor: AppColors.transparent,
                  emojiSizeMax: 28 * (Platform.isIOS ? 1.2 : 1.0),
                ),
                swapCategoryAndBottomBar: false,
                skinToneConfig: const SkinToneConfig(),
                categoryViewConfig: CategoryViewConfig(
                    backgroundColor: AppColors.transparent,
                    customCategoryView: (_, __, ___, ____) {
                      return const SizedBox.shrink();
                    }),
                bottomActionBarConfig:
                    BottomActionBarConfig(customBottomActionBar: (_, __, ___) {
                  return const SizedBox.shrink();
                }),
                searchViewConfig: const SearchViewConfig(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final DateTime dateTime;
  final bool isSender;

  const ChatBubble({
    super.key,
    required this.message,
    required this.dateTime,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6,
          ),
          child: Column(
            crossAxisAlignment:
                isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 21,
                  vertical: 13,
                ),
                decoration: BoxDecoration(
                  gradient: isSender
                      ? AppColors.primaryVariantGradient
                      : AppColors.primaryVariantGradientSemiTransperent,
                  borderRadius: BorderRadius.only(
                    topLeft: isSender
                        ? const Radius.circular(32)
                        : const Radius.circular(24),
                    topRight: isSender
                        ? const Radius.circular(24)
                        : const Radius.circular(32),
                    bottomRight:
                        isSender ? Radius.zero : const Radius.circular(32),
                    bottomLeft:
                        isSender ? const Radius.circular(32) : Radius.zero,
                  ),
                ),
                child: Text(
                  message,
                  style: 16.0.regular,
                ),
              ),
              const Gap(8),
              Text(
                /// Should be refactored to use a time formatter
                '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}',
                style: 12.0.regular,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AppEmojiPicker extends EmojiPickerView {
  final TextEditingController textEditingController;

  const AppEmojiPicker(super.config, super.state, super.showSearchBar,
      this.textEditingController,
      {super.key});

  @override
  State<AppEmojiPicker> createState() => _AppEmojiPickerState();
}

class _AppEmojiPickerState extends State<AppEmojiPicker> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.chatHeaderBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: EmojiPicker(
        config: widget.config,
        textEditingController: widget.textEditingController,
      ),
    );
  }
}

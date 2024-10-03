import 'package:flutter/material.dart';
import '../extensions/text_styles/int_text_style_extension.dart';
import '../config/app_colors.dart';

class AppPopupMenuButton extends StatelessWidget {
  const AppPopupMenuButton({
    super.key,
    required this.fillColor,
    required this.iconColor,
    required this.onTapEdit,
    required this.onTapDelete,
  });

  final Color fillColor;
  final Color iconColor;
  final Function()? onTapEdit;
  final Function()? onTapDelete;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      style: ButtonStyle(
        shape: const WidgetStatePropertyAll(
          CircleBorder(),
        ),
        backgroundColor: WidgetStatePropertyAll(
          fillColor,
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.zero,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: Icon(
        Icons.more_horiz_rounded,
        color: iconColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: AppColors.black.withOpacity(0.8),
      elevation: 0,
      itemBuilder: (context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            onTap: onTapEdit,
            child: Text(
              'Edit',
              style: 16.0.regular,
            ),
          ),
          PopupMenuItem(
            onTap: onTapDelete,
            child: Text(
              'Delete',
              style: 16.0.regular,
            ),
          ),
        ];
      },
    );
  }
}
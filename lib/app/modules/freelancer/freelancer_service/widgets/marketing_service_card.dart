import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../extensions/text_styles/int_text_style_extension.dart';
import '../../../../config/app_colors.dart';
import '../../../../domain/entities/marketing_service.dart';
import '../../../../widgets/app_popup_menu_button.dart';

class MarketingServiceCard extends StatelessWidget {
  final MarketingService marketingService;
  final Function()? onTapEdit;
  final Function()? onTapDelete;

  const MarketingServiceCard({
    super.key,
    required this.marketingService,
    this.onTapEdit,
    this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Ink(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: AppColors.primaryVariantGradient,
          ),
          child: Stack(
            children: <Widget>[
              Ink(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColors.grey50.withOpacity(0.2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      marketingService.title,
                      style: 20.0.bold,
                    ),
                    const Gap(16),
                    Text(
                      marketingService.description ??
                          'Description not available',
                      style: 14.0.medium,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: AppPopupMenuButton(
                  fillColor: AppColors.white,
                  iconColor: AppColors.black,
                  onTapEdit: onTapEdit,
                  onTapDelete: onTapDelete,
                ),
              ),
            ],
          ),
        ),
        const Gap(16),
      ],
    );
  }
}

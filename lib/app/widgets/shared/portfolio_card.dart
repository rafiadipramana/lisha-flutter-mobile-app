import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lisha/app/widgets/app_popup_menu_button.dart';
import '../../extensions/text_styles/int_text_style_extension.dart';
import '../../extensions/url_path/string_url_path_extension.dart';
import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import '../../data/services/supabase_service.dart';
import '../../domain/entities/portfolio.dart';

class PortfolioCard extends StatelessWidget {
  final Portfolio portfolio;
  final Function()? onTapEdit;
  final Function()? onTapDelete;
  final Function()? onLikeTap;

  const PortfolioCard({
    super.key,
    required this.portfolio,
    this.onTapEdit,
    this.onTapDelete,
    this.onLikeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.black200,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: portfolio.imageUrl != null
                  ? Image.network(
                      SupabaseService.getPortfolioImageDownloadUrl(
                        portfolio.imageUrl!.fileName,
                      ),
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      AppAssets.workCardDummy,
                    ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    portfolio.title,
                    style: 14.0.medium,
                  ),
                ),
                const Gap(8),
                // InkWell(
                //   onTap: () {},
                //   borderRadius: BorderRadius.circular(40),
                //   child: Ink(
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: AppColors.white.withOpacity(0.06),
                //     ),
                //     child: const Padding(
                //       padding: EdgeInsets.all(8),
                //       child: Icon(
                //         Icons.more_horiz,
                //         color: AppColors.grey200,
                //       ),
                //     ),
                //   ),
                // )
                onLikeTap == null
                    ? AppPopupMenuButton(
                        fillColor: AppColors.white.withOpacity(0.06),
                        iconColor: AppColors.grey200,
                        onTapEdit: onTapEdit,
                        onTapDelete: onTapDelete,
                      )
                    : IconButton.filled(
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.white.withOpacity(0.06), 
                        ),
                        onPressed: onLikeTap,
                        icon: const Icon(
                          Icons.favorite_border_rounded,
                          color: AppColors.grey200,
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

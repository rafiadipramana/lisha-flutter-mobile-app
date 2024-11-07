import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lisha/app/extensions/text_styles/int_text_style_extension.dart';

import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../views/service_view.dart';

class ClientServiceCarouselItem extends StatelessWidget {
  const ClientServiceCarouselItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'APP UI/UX',
                style: 14.0.regular.copyWith(
                  color: AppColors.white.withOpacity(0.7),
                  height: 0,
                ),
              ),
              Text(
                'APP\nUI/UX',
                style: 36.0.semiBold.copyWith(
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'APP UI/UX',
                style: 12.0.regular,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.all(32),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(44),
              gradient: const LinearGradient(
                colors: [
                  AppColors.white,
                  AppColors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(
                    AppAssets.workCardDummy,
                  ),
                ),
                const Gap(24),
                Text(
                  'Photography',
                  style: 24.0.semiBold,
                ),
                const Gap(12),
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: <Widget>[
                    _buildServiceTag(tag: 'New'),
                    _buildServiceTag(tag: 'Trending'),
                    _buildServiceTag(tag: 'Popular')
                  ],
                ),
                const Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '5.0',
                      style: 18.0.medium,
                    ),
                    const Gap(10),
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          AppAssets.fullStarIcon,
                        ),
                        const Gap(4),
                        SvgPicture.asset(
                          AppAssets.fullStarIcon,
                        ),
                        const Gap(4),
                        SvgPicture.asset(
                          AppAssets.fullStarIcon,
                        ),
                        const Gap(4),
                        SvgPicture.asset(
                          AppAssets.fullStarIcon,
                        ),
                        const Gap(4),
                        SvgPicture.asset(
                          AppAssets.emptyStarIcon,
                        ),
                      ],
                    ),
                  ],
                ),
                const Gap(16),

                /// Indicator
                const ServiceCarouselIndicator(
                  activeIndex: 0,
                  itemCount: 4,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row _buildServiceTag({
    required String tag,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 8,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: AppColors.white.withOpacity(0.1),
            ),
          ),
          child: Text(
            tag,
            style: 12.0.medium,
          ),
        ),
      ],
    );
  }
}

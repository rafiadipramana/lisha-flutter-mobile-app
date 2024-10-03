import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../extensions/text_styles/int_text_style_extension.dart';
import '../../../../config/app_colors.dart';
import '../../../../domain/entities/portfolio_category.dart';

class PortfolioCategoryButton extends StatelessWidget {
  final PortfolioCategory portfolioCategory;
  final bool isActive;
  final Function() onTap;

  const PortfolioCategoryButton({
    super.key,
    required this.portfolioCategory,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(40),
          child: Ink(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 9,
            ),
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary : AppColors.transparent,
              borderRadius: BorderRadius.circular(40),
              border: isActive
                  ? null
                  : Border.all(
                color: AppColors.grey100,
                width: 1,
              ),
            ),
            child: Text(
              portfolioCategory.name,
              style: 14.0.regular,
            ),
          ),
        ),
        const Gap(10),
      ],
    );
  }
}
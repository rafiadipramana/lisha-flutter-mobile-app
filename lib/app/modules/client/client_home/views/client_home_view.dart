import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:lisha/app/config/app_assets.dart';
import 'package:lisha/app/config/app_colors.dart';
import 'package:lisha/app/domain/entities/portfolio.dart';
import 'package:lisha/app/domain/entities/portfolio_category.dart';
import 'package:lisha/app/extensions/text_styles/int_text_style_extension.dart';
import 'package:lisha/app/widgets/app_elevated_button.dart';
import 'package:lisha/app/widgets/shared/portfolio_card.dart';
import 'package:lisha/app/widgets/shared/portfolio_category_button.dart';

import '../controllers/client_home_controller.dart';

class ClientHomeView extends GetView<ClientHomeController> {
  const ClientHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final double paddingTop = MediaQuery.paddingOf(context).top;
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Stack(
        children: <Widget>[
          Stack(
            children: [
              Ink.image(
                image: const AssetImage(
                  AppAssets.clientHomeBackground,
                ),
                fit: BoxFit.cover,
                height: height * 0.5,
              ),
              Positioned.fill(
                child: Ink(
                  color: AppColors.black100.withOpacity(0.6),
                ),
              ),
              Positioned(
                top: paddingTop + 20,
                left: 20,
                right: 20,
                child: Material(
                  type: MaterialType.transparency,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Ink(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.black100,
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(
                              color: AppColors.grey500,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Ink(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.white.withOpacity(0.06),
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  AppAssets.searchIcon,
                                ),
                              ),
                              const Gap(8),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Looking for work',
                                    hintStyle: 14.0.regular,
                                    border: InputBorder.none,
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(12),
                      Material(
                        shape: const CircleBorder(),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(40),
                          child: Ink(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.black100,
                              border: Border.all(
                                color: AppColors.white.withOpacity(0.1),
                                width: 1,
                              ),
                            ),
                            child: SvgPicture.asset(
                              AppAssets.notificationIcon,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0 + paddingTop,
                left: 20,
                bottom: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Graphic Designer',
                      style: 32.0.semiBold,
                    ),
                    const Gap(8),
                    Text(
                      'Mobile Design, UI/Visual Design,\nUX Design/ Research',
                      style: 14.0.medium.copyWith(
                            color: AppColors.white.withOpacity(0.8),
                          ),
                    ),
                    const Gap(24),
                    AppElevatedButton(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                      ),
                      child: Text(
                        'Hire Me',
                        style: 14.0.medium,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Positioned(
                left: 24,
                right: 24,
                bottom: 16 + 26,
                child: Row(
                  children: <Widget>[
                    Ink.image(
                      image: const AssetImage(
                        AppAssets.appLogo,
                      ),
                      width: 44,
                      height: 44,
                    ),
                    const Gap(8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Lisha',
                          style: 16.0.medium,
                        ),
                        const Gap(4),
                        Text(
                          'Posted 12hr ago',
                          style: 12.0.regular.copyWith(
                                color: AppColors.white.withOpacity(0.6),
                              ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Ink(
                              decoration: const BoxDecoration(
                                color: AppColors.grey150,
                                shape: BoxShape.circle,
                              ),
                              height: 12,
                              width: 12,
                            ),
                            const Gap(6),
                            Ink(
                              decoration: const BoxDecoration(
                                color: AppColors.grey150,
                                shape: BoxShape.circle,
                              ),
                              height: 12,
                              width: 12,
                            ),
                            const Gap(6),
                            Ink(
                              decoration: const BoxDecoration(
                                gradient: AppColors.primaryVariantGradient,
                                shape: BoxShape.circle,
                              ),
                              height: 12,
                              width: 12,
                            ),
                            const Gap(6),
                            Ink(
                              decoration: const BoxDecoration(
                                color: AppColors.grey150,
                                shape: BoxShape.circle,
                              ),
                              height: 12,
                              width: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      'Get Premium ',
                      style: 14.0.regular.copyWith(
                            color: AppColors.primary,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Material(
            type: MaterialType.transparency,
            child: DraggableScrollableSheet(
              controller: controller.draggableScrollableController,
              initialChildSize: 0.5,
              minChildSize: 0.5,
              maxChildSize: 1,
              snap: true,
              builder: (context, scrollController) {
                double offset = 0.0;
                scrollController.addListener(() {
                  offset = scrollController.offset;
                  controller.gridViewScrollValue = offset;
                  print(offset);
                });

                return Ink(
                  color: AppColors.black100,
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: <Widget>[
                      PinnedHeaderSliver(
                        child: Material(
                          type: MaterialType.transparency,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Gap(24),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Ink(
                                          height: 6,
                                          width: width * 0.15,
                                          decoration: BoxDecoration(
                                            color: AppColors.grey500,
                                            borderRadius:
                                                BorderRadius.circular(32),
                                          ),
                                        ),
                                      ),
                                      const Gap(24),
                                      Obx(
                                        () {
                                          final double opacity = (78 -
                                                      controller
                                                          .gridViewScrollValue)
                                                  .clamp(0, 78) /
                                              78;
                                          return AnimatedOpacity(
                                            opacity: opacity,
                                            duration: const Duration(
                                              milliseconds: 0,
                                            ),
                                            child: Text(
                                              'My work',
                                              style: 24.0.medium.copyWith(
                                                    color: AppColors.white,
                                                  ),
                                            ),
                                          );
                                        },
                                      ),
                                      const Gap(4),
                                      Obx(
                                        () {
                                          final double opacity = (78 -
                                                      controller
                                                          .gridViewScrollValue)
                                                  .clamp(0, 78) /
                                              78;
                                          return AnimatedOpacity(
                                            opacity: opacity,
                                            duration: const Duration(
                                              milliseconds: 0,
                                            ),
                                            child: Text(
                                              'Click on the project for more info',
                                              style: 14.0.regular.copyWith(
                                                    color: AppColors.white
                                                        .withOpacity(
                                                      0.7,
                                                    ),
                                                  ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Obx(
                                () {
                                  final double height = 24.0 *
                                      (1 -
                                          (controller.gridViewScrollValue / 78)
                                              .clamp(0, 1));
                                  return AnimatedContainer(
                                    duration: const Duration(
                                      milliseconds: 0,
                                    ),
                                    child: Gap(height),
                                  );
                                },
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Obx(
                                  () {
                                    return Row(
                                      children: <Widget>[
                                        const Gap(24),
                                        ...controller
                                            .freelancerPortfolioCategories
                                            .map((PortfolioCategory
                                                portfolioCategory) {
                                          return PortfolioCategoryButton(
                                            portfolioCategory:
                                                PortfolioCategory(
                                              id: portfolioCategory.id,
                                              name: portfolioCategory.name,
                                            ),
                                            isActive: controller
                                                    .selectedfreelancerPortfolioCategoryIndex ==
                                                portfolioCategory.id,
                                            onTap: () => controller
                                                .getPortfolioByCategoryId(
                                              portfolioCategory.id,
                                            ),
                                          );
                                        })
                                      ],
                                    );
                                  },
                                ),
                              ),
                              const Gap(24),
                            ],
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        sliver: Obx(
                          () => SliverGrid(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.7,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final Portfolio portfolioItem =
                                    controller.filteredPortfolios[index];
                                return PortfolioCard(
                                  key: ValueKey(index),
                                  portfolio: Portfolio(
                                    title: portfolioItem.title,
                                    category: portfolioItem.category,
                                  ),
                                  onLikeTap: () {},
                                );
                              },
                              childCount:
                                  controller.filteredPortfolios.length,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

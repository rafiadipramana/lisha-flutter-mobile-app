import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../../../domain/entities/portfolio_category.dart';
import '../../../../extensions/text_styles/int_text_style_extension.dart';
import '../../../../widgets/app_elevated_button.dart';
import '../controllers/home_controller.dart';
import '../../../../widgets/shared/portfolio_card.dart';
import '../../../../widgets/shared/portfolio_category_button.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Ink.image(
            image: const AssetImage(
              AppAssets.homeBackground,
            ),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          ),
          Ink(
            decoration: BoxDecoration(
              color: AppColors.black.withOpacity(0.8),
            ),
            width: double.infinity,
            height: 300,
          ),
          RefreshIndicator(
            onRefresh: () async {
              await controller.onRefresh();
            },
            child: CustomScrollView(
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                /// Sliver Header
                PinnedHeaderSliver(
                  /// This is the work section (should by refactored to a separate widget)
                  child: Obx(
                    () {
                      return ClipRRect(
                        child: BackdropFilter(
                          filter: controller.scrollStream.value > 0
                              ? ImageFilter.blur(sigmaX: 10, sigmaY: 10)
                              : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: controller.scrollStream.value > 0
                                  ? AppColors.black.withOpacity(0.8)
                                  : AppColors.transparent,
                            ),
                            child: Column(
                              children: <Widget>[
                                Gap(paddingTop),
                                const Gap(13),

                                /// This is user profile section (should by refactored to a separate widget)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Welcome Back!',
                                            style: 14.0.medium,
                                          ),
                                          const Gap(4),
                                          Text(
                                            controller.user?.userMetadata?[
                                                    'first_name'] ??
                                                '',
                                            style: 24.0.semiBold,
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Material(
                                        shape: const CircleBorder(),
                                        child: InkWell(
                                          onTap: () {},
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Ink(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.black100,
                                              border: Border.all(
                                                color: AppColors.white
                                                    .withOpacity(0.1),
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
                                const Gap(20),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      /// This is the portfolio section (should by refactored to a separate widget)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Ink(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            gradient: AppColors.primaryVariantGradient,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Welcome ${controller.user?.userMetadata?['first_name'] ?? ''}!',
                                    style: 14.0.medium,
                                  ),
                                  const Gap(8),
                                  Text(
                                    'Showcase your portfolio',
                                    style: 32.0.semiBold,
                                  ),
                                ],
                              ),
                              const Gap(33),
                              Row(
                                children: [
                                  AppElevatedButton.secondary(
                                    onPressed:
                                        controller.navigateToAddPortfolio,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 23,
                                      vertical: 10,
                                    ),
                                    child: Text(
                                      'Add Portfolio',
                                      style: 16.0.medium.copyWith(
                                            color: AppColors.primaryVariant,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      const Gap(22),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'My work',
                              style: 24.0.medium,
                            ),
                            const Gap(4),
                            Text(
                              'Click on the project for more info',
                              style: 14.0.regular.copyWith(
                                    color: AppColors.white.withOpacity(0.7),
                                  ),
                            ),
                          ],
                        ),
                      ),

                      const Gap(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Obx(
                              () {
                                return Row(
                                  children: <Widget>[
                                    const Gap(24),
                                    ...controller.portfolioCategories.map(
                                      (PortfolioCategory portfolioCategory) {
                                        final id = portfolioCategory.id;

                                        final isActive = id ==
                                            controller.selectedCategoryIndex;
                                        onTap() => controller
                                            .getPortfolioByCategoryId(id);

                                        return PortfolioCategoryButton(
                                          portfolioCategory: portfolioCategory,
                                          isActive: isActive,
                                          onTap: onTap,
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// SLiver Grid View
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(24, 30, 24, 0),
                  sliver: Obx(
                    () {
                      return SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.723,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return PortfolioCard(
                              portfolio: controller.filteredPortfolios[index],
                              onTapEdit: () => controller.navigateToEditPortfolio(
                                controller.filteredPortfolios[index],
                              ),
                              onTapDelete: () => controller.displayDeleteConfirmationDialog(
                                portfolio: controller.filteredPortfolios[index],
                              ),
                            );
                          },
                          childCount: controller.filteredPortfolios.length,
                        ),
                      );
                    },
                  ),
                ),
                const SliverGap(24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


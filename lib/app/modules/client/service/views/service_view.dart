import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lisha/app/config/app_assets.dart';
import 'package:lisha/app/config/app_colors.dart';
import 'package:lisha/app/extensions/text_styles/int_text_style_extension.dart';
import '../controllers/service_controller.dart';

class ServiceView extends GetView<ServiceController> {
  const ServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ServiceView'),
        centerTitle: true,
      ),
      body: CarouselSlider(
        carouselController: controller.serviceCarouselSliderController,
        options: CarouselOptions(
          height: double.infinity,
          enlargeCenterPage: true,
          viewportFraction: 0.75,
        ),
        items: [
          Container(
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(44),
              gradient: LinearGradient(
                colors: [
                  AppColors.white,
                  AppColors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
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

class ServiceCarouselIndicator extends StatelessWidget {
  final int activeIndex;
  final int itemCount;

  const ServiceCarouselIndicator({
    super.key,
    required this.activeIndex,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) {
          return _buildCarouselItem(
            index == activeIndex,
          );
        },
      ),
    );
  }

  Container _buildCarouselItem(bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? null : AppColors.white.withOpacity(0.5),
        gradient: isActive ? AppColors.primaryVariantGradient : null,
      ),
    );
  }
}

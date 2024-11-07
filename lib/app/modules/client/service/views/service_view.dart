import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lisha/app/config/app_assets.dart';
import 'package:lisha/app/config/app_colors.dart';
import 'package:lisha/app/modules/client/service/widgets/ClientServiceCarouselItem.dart';
import '../controllers/service_controller.dart';

class ServiceView extends GetView<ServiceController> {
  const ServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.paddingOf(context).top;
    return Stack(
      children: <Widget>[
        Material(
          type: MaterialType.transparency,
          child: PageView(
            controller: controller.pageController,
            children: <Widget>[
              Ink.image(
                image: const AssetImage(AppAssets.freelancerServiceBackground1),
                fit: BoxFit.cover,
              ),
              Ink.image(
                image: const AssetImage(AppAssets.freelancerServiceBackground2),
                fit: BoxFit.cover,
              ),
              Ink.image(
                image: const AssetImage(AppAssets.freelancerServiceBackground3),
                fit: BoxFit.cover,
              ),
              Ink.image(
                image: const AssetImage(AppAssets.freelancerServiceBackground4),
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        Scaffold(
          backgroundColor: AppColors.transparent,
          body: Column(
            children: <Widget>[
              Gap(paddingTop),
              Image.asset(
                AppAssets.appLogo,
                height: 75,
              ),
              Expanded(
                child: CarouselSlider(
                  carouselController:
                      controller.serviceCarouselSliderController,
                  options: controller.carouselOptions,
                  items: const <Widget>[
                    ClientServiceCarouselItem(),
                    ClientServiceCarouselItem(),
                    ClientServiceCarouselItem(),
                  ],
                ),
              ),
            ],
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

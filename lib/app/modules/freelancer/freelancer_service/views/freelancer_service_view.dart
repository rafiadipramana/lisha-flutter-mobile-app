import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lisha/app/domain/entities/marketing_service.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../../../extensions/text_styles/int_text_style_extension.dart';
import '../controllers/freelancer_service_controller.dart';
import '../widgets/marketing_service_card.dart';

class FreelancerServiceView extends GetView<FreelancerServiceController> {
  const FreelancerServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Stack(
      children: <Widget>[
        Material(
          child: Ink.image(
            image: const AssetImage(
              AppAssets.serviceBackground,
            ),
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
              Gap(paddingTop),
              const Gap(37),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Marketing',
                          style: 24.0.bold,
                        ),
                        const Gap(8),
                        Text(
                          'Research, social media & plans',
                          style: 16.0.regular,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: controller.navigateToAddFreelancerService,
                      borderRadius: BorderRadius.circular(100),
                      child: Ink(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white.withOpacity(0.06),
                          border: Border.all(
                            color: AppColors.white.withOpacity(0.1),
                          ),
                        ),
                        child: const Icon(
                          Icons.add_rounded,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(28),
              _buildMarketingServiceCardListView(),
            ],
          ),
        ),
      ],
    );
  }

  Expanded _buildMarketingServiceCardListView() {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: controller.getMarketingServices,
        child: Obx(
          () {
            return Material(
              type: MaterialType.transparency,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 0,
                ),
                itemCount: controller.marketingServices.length,
                itemBuilder: (_, index) {
                  final marketingService = controller.marketingServices[index];
                  return MarketingServiceCard(
                    marketingService: marketingService,
                    onTapEdit: () => controller.navigateToEditFreelancerService(
                      marketingService: marketingService,
                    ),
                    onTapDelete: () => controller.displayDeleteConfirmationDialog(
                      marketingService: marketingService,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

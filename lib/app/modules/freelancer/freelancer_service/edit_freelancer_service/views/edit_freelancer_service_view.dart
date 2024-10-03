import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lisha/app/extensions/url_path/string_url_path_extension.dart';
import '../../../../../data/services/supabase_service.dart';
import '../../../../../extensions/file_path/file_path_extension.dart';
import '../../../../../extensions/text_styles/int_text_style_extension.dart';
import '../../../../../config/app_assets.dart';
import '../../../../../config/app_colors.dart';
import '../../../../../widgets/app_elevated_button.dart';
import '../controllers/edit_freelancer_service_controller.dart';

class EditFreelancerServiceView
    extends GetView<EditFreelancerServiceController> {
  const EditFreelancerServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Stack(
      children: <Widget>[
        // Background
        Material(
          child: Ink.image(
            image: const AssetImage(
              AppAssets.portfolioBackground,
            ),
            fit: BoxFit.cover,
          ),
        ),

        PopScope(
          canPop: controller.handlePop(),
          onPopInvokedWithResult: (bool result, dynamic data) {
            if (!result) controller.displayConfirmDialog();
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Gap(paddingTop),
                    const Gap(23),
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: controller.back,
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
                              Icons.arrow_back_rounded,
                            ),
                          ),
                        ),
                        const Gap(16),
                        Text(
                          'Edit Service',
                          style: 18.0.medium,
                        ),
                      ],
                    ),
                    const Gap(24),

                    /// Form start from here
                    Text(
                      'Service Title',
                      style: 14.0.medium,
                    ),
                    const Gap(8),
                    TextFormField(
                      controller: controller.serviceTitleController,
                      style: 16.0.regular,
                      decoration: InputDecoration(
                        hintText: 'Enter your name',
                        hintStyle: 16.0.regular.copyWith(
                              color: AppColors.white.withOpacity(0.5),
                            ),
                        filled: true,
                        fillColor: AppColors.white.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: AppColors.white.withOpacity(0.1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: AppColors.white.withOpacity(0.1),
                          ),
                        ),
                      ),
                    ),

                    const Gap(24),
                    Text(
                      'Service Description',
                      style: 14.0.medium,
                    ),
                    const Gap(16),
                    TextFormField(
                      controller: controller.serviceDescriptionController,
                      style: 16.0.regular,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Enter your service description',
                        hintStyle: 16.0.regular.copyWith(
                              color: AppColors.white.withOpacity(0.5),
                            ),
                        filled: true,
                        fillColor: AppColors.white.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: AppColors.white.withOpacity(0.1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: AppColors.white.withOpacity(0.1),
                          ),
                        ),
                      ),
                    ),

                    const Gap(24),
                    Text(
                      'Set Price',
                      style: 14.0.medium,
                    ),
                    const Gap(8),
                    TextFormField(
                      controller: controller.servicePriceController,
                      keyboardType: TextInputType.number,
                      style: 16.0.regular,
                      decoration: InputDecoration(
                        hintText: 'Enter your service price',
                        hintStyle: 16.0.regular.copyWith(
                              color: AppColors.white.withOpacity(0.5),
                            ),
                        filled: true,
                        fillColor: AppColors.white.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: AppColors.white.withOpacity(0.1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: AppColors.white.withOpacity(0.1),
                          ),
                        ),
                      ),
                    ),

                    const Gap(24),
                    Text(
                      'Upload Service Image',
                      style: 14.0.medium,
                    ),
                    const Gap(16),
                    InkWell(
                      onTap: controller.pickImage,
                      borderRadius: BorderRadius.circular(16),
                      child: Obx(
                        () {
                          return Ink(
                            height: 150,
                            decoration: BoxDecoration(
                              color: controller.serviceImage.path.isNotEmpty || controller.networkServiceImageUrl.fileName.isNotEmpty
                                  ? null
                                  : AppColors.white.withOpacity(0.1),
                              image: controller.serviceImage.path.isNotEmpty || controller.networkServiceImageUrl.fileName.isNotEmpty
                                  ? DecorationImage(
                                      image: controller.isServiceImageChanged
                                          ? FileImage(controller.serviceImage)
                                          : NetworkImage(
                                              SupabaseService
                                                  .getMarketingServiceImageDownloadUrl(
                                                controller
                                                    .networkServiceImageUrl
                                                    .fileName,
                                              ),
                                            ),
                                      opacity: 0.5,
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                              border: Border.all(
                                color: AppColors.white.withOpacity(0.1),
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                AppAssets.imageIcon,
                                height: 24,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Gap(50),
                    AppElevatedButton(
                      onPressed: controller.updateMarketingService,
                      child: Text(
                        'Update Service',
                        style: 14.0.medium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

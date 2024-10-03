import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:lisha/app/config/app_assets.dart';
import 'package:lisha/app/config/app_colors.dart';
import 'package:lisha/app/domain/entities/portfolio_category.dart';
import 'package:lisha/app/extensions/text_styles/int_text_style_extension.dart';
import 'package:lisha/app/widgets/app_elevated_button.dart';

import '../controllers/add_portfolio_controller.dart';

class AddPortfolioView extends GetView<AddPortfolioController> {
  const AddPortfolioView({super.key});

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
                          'Create Portfolio',
                          style: 18.0.medium,
                        ),
                      ],
                    ),
                    const Gap(24),

                    /// Form start from here
                    Text(
                      'Choose Category',
                      style: 14.0.medium,
                    ),
                    const Gap(8),
                    Obx(
                      () {
                        return DropdownButton2<PortfolioCategory>(
                          value: controller.selectedPortfolioCategory,
                          hint: const Text('Select category'),
                          onChanged: (PortfolioCategory? value) {
                            controller.selectedPortfolioCategory = value;
                          },
                          style: 16.0.regular,
                          isExpanded: true,
                          underline: const SizedBox.shrink(),
                          iconStyleData: IconStyleData(
                            icon: SvgPicture.asset(
                              AppAssets.arrowDownIcon,
                            ),
                          ),
                          buttonStyleData: ButtonStyleData(
                            padding: const EdgeInsets.fromLTRB(4, 0, 16, 0),
                            decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.1),
                              border: Border.all(
                                color: AppColors.white.withOpacity(0.1),
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          items: controller.portfolioCategories.map(
                            (category) {
                              return DropdownMenuItem<PortfolioCategory>(
                                value: category,
                                child: Text(category.name),
                              );
                            },
                          ).toList(),
                          dropdownStyleData: DropdownStyleData(
                            elevation: 0,
                            offset: const Offset(0, -10),
                            decoration: BoxDecoration(
                              color: AppColors.black.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        );
                      },
                    ),

                    const Gap(24),
                    Text(
                      'Project Title',
                      style: 14.0.medium,
                    ),
                    const Gap(8),
                    TextFormField(
                      controller: controller.portfolioTitleController,
                      style: 16.0.regular,
                      decoration: InputDecoration(
                        hintText: 'Enter your project name',
                        hintStyle: 16.0.regular.copyWith(
                              color: AppColors.white.withOpacity(0.5),
                            ),
                        filled: true,
                        fillColor: AppColors.white.withOpacity(0.1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: AppColors.white.withOpacity(0.1),
                            )),
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
                      'Project Description',
                      style: 14.0.medium,
                    ),
                    const Gap(16),
                    TextFormField(
                      controller: controller.portfolioDescriptionController,
                      style: 16.0.regular,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Enter your project description',
                        hintStyle: 16.0.regular.copyWith(
                              color: AppColors.white.withOpacity(0.5),
                            ),
                        filled: true,
                        fillColor: AppColors.white.withOpacity(0.1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: AppColors.white.withOpacity(0.1),
                            )),
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
                      'Upload Project Image',
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
                              color: controller.portfolioImage.path.isEmpty
                                  ? AppColors.white.withOpacity(0.1)
                                  : null,
                              image: controller.portfolioImage.path.isNotEmpty
                                  ? DecorationImage(
                                      image:
                                          FileImage(controller.portfolioImage),
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
                      onPressed: controller.addPortfolio,
                      child: Text(
                        'Create Portfolio',
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

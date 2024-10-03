import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:lisha/app/config/app_assets.dart';
import 'package:lisha/app/config/app_colors.dart';
import 'package:lisha/app/extensions/text_styles/int_text_style_extension.dart';
import 'package:lisha/app/modules/freelancer/freelancer_appointment/controllers/freelancer_appointment_controller.dart';

import '../widgets/appointment_card.dart';

class FreelancerAppointmentView
    extends GetView<FreelancerAppointmentController> {
  const FreelancerAppointmentView({super.key});

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
          backgroundColor: AppColors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Gap(paddingTop),
              const Gap(26),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Text(
                  'Appointment',
                  style: 20.0.medium,
                ),
              ),
              const Gap(32),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Ink(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8),
                    border: GradientBoxBorder(
                      gradient: AppColors.primaryGradient,
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        AppAssets.searchIcon,
                      ),
                      const Gap(10),
                      Expanded(
                        child: TextFormField(
                          style: 16.0.regular,
                          decoration: const InputDecoration(
                            hintText: 'Filter',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(12),
              Expanded(
                child: Material(
                  color: AppColors.transparent,
                  child: Obx(
                    () {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                        itemCount: controller.appointments.length,
                        itemBuilder: (context, index) {
                          final appointment = controller.appointments[index];
                          return Column(
                            children: <Widget>[
                              AppointmentCard(
                                appointment: appointment,
                              ),
                              const Gap(24),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

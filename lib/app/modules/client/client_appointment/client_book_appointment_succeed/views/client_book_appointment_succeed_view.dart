import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:lisha/app/config/app_assets.dart';
import 'package:lisha/app/config/app_colors.dart';
import 'package:lisha/app/extensions/date_time/date_time_extension.dart';
import 'package:lisha/app/extensions/date_time/string_date_time_extension.dart';
import 'package:lisha/app/extensions/text_styles/int_text_style_extension.dart';
import 'package:lisha/app/widgets/app_elevated_button.dart';

import '../controllers/client_book_appointment_succeed_controller.dart';

class ClientBookAppointmentSucceedView
    extends GetView<ClientBookAppointmentSucceedController> {
  const ClientBookAppointmentSucceedView({super.key});
  @override
  Widget build(BuildContext context) {
    final double paddingTop = MediaQuery.paddingOf(context).top;
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Gap(paddingTop),
                Image.asset(
                  AppAssets.appLogo,
                  width: 75,
                ),
                const Gap(24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Ink(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.grey50,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: <Widget>[
                        _buildCardHeader(),
                        const DottedLine(
                          dashColor: AppColors.grey350,
                          dashGapLength: 4,
                          dashLength: 4,
                        ),
                        const Gap(32),
                        _buildCardBody(),
                        const DottedLine(
                          dashColor: AppColors.grey350,
                          dashGapLength: 4,
                          dashLength: 4,
                        ),
                        const Gap(32),
                        Ink(
                          padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Full Name:',
                                    style: 16.0.regular.copyWith(
                                          color: AppColors.grey300,
                                        ),
                                  ),
                                  Text(
                                    controller.appointment.fullName,
                                    style: 16.0.regular,
                                  ),
                                ],
                              ),
                              const Gap(16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Email:',
                                    style: 16.0.regular.copyWith(
                                          color: AppColors.grey300,
                                        ),
                                  ),
                                  Text(
                                    controller.appointment.email,
                                    style: 16.0.regular,
                                  ),
                                ],
                              ),
                              Gap(
                                controller.appointment.guests!.isNotEmpty
                                    ? 5
                                    : 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Guest:',
                                    style: 16.0.regular.copyWith(
                                          color: AppColors.grey300,
                                        ),
                                  ),
                                  controller.appointment.guests!.isNotEmpty
                                      ? Expanded(
                                          child: AvatarStack(
                                            height: 40,
                                            settings: RestrictedAmountPositions(
                                              align: StackAlign.right,
                                              minCoverage: 0.5,
                                              laying: StackLaying.first,
                                            ),
                                            borderColor: AppColors.grey350,
                                            avatars: const <ImageProvider>[
                                              AssetImage(
                                                AppAssets.profilePictureDummy,
                                              ),
                                              AssetImage(
                                                AppAssets.profilePictureDummy,
                                              ),
                                              AssetImage(
                                                AppAssets.profilePictureDummy,
                                              ),
                                            ],
                                          ),
                                        )
                                      : Text(
                                          'No Guest',
                                          style: 16.0.regular,
                                        ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Material(
                type: MaterialType.transparency,
                child: AppElevatedButton(
                  onPressed: controller.back,
                  child: Text(
                    'Back to Home',
                    style: 16.0.medium,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Ink _buildCardBody() {
    return Ink(
      padding: const EdgeInsets.symmetric(
        vertical: 24.0,
      ),
      child: Column(
        children: <Widget>[
          Text(
            '${controller.appointment.time.duration} Minute Meeting',
            style: 24.0.semiBold,
          ),
          const Gap(8),
          Text(
            // '09:30am - 10:00am',
            '${controller.appointment.time.time.toDateTime.toTime}${controller.appointment.time.type.name.toLowerCase()} - ${(controller.appointment.time.time.toDateTime.add(Duration(minutes: controller.appointment.time.duration))).toTime}${controller.appointment.time.type.name.toLowerCase()}',
            style: 16.0.regular.copyWith(
                  color: AppColors.grey300,
                ),
          ),
          const Gap(8),
          Text(
            // 'Thuesday, March 22, 2024',
            controller.appointment.date.toFullDate,
            style: 18.0.regular.copyWith(
                  color: AppColors.grey300,
                ),
          ),
          const Gap(16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SvgPicture.asset(
                AppAssets.globeIcon,
              ),
              const Gap(8),
              Text(
                'Indochina Time',
                style: 14.0.regular,
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _buildCardHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 24.0,
      ),
      child: Column(
        children: <Widget>[
          Ink(
            padding: const EdgeInsets.all(15.0),
            decoration: const BoxDecoration(
              gradient: AppColors.primaryVariantGradient,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check_circle_rounded),
          ),
          const Gap(32),
          Text(
            'Confirmed',
            style: 24.0.medium,
          ),
          const Gap(4),
          Text(
            'You are scheduled with ${controller.appointment.freelancer?.firstName}',
            style: 16.0.regular.copyWith(
                  color: AppColors.grey300,
                ),
          ),
          const Gap(16),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(8),
            child: Ink(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.grey350,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(
                    Icons.add_rounded,
                    color: AppColors.primary,
                  ),
                  const Gap(8),
                  Text(
                    'Add to Calendar',
                    style: 16.0.medium.copyWith(
                          color: AppColors.primary,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

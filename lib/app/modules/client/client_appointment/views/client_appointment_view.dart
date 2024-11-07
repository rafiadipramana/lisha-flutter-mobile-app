import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lisha/app/config/app_assets.dart';
import 'package:lisha/app/config/app_colors.dart';
import 'package:lisha/app/domain/entities/appointment.dart';
import 'package:lisha/app/extensions/date_time/date_time_extension.dart';
import 'package:lisha/app/extensions/date_time/string_date_time_extension.dart';
import 'package:lisha/app/extensions/text_styles/int_text_style_extension.dart';
import 'package:lisha/app/modules/client/client_appointment/controllers/client_appointment_controller.dart';
import 'package:lisha/app/widgets/app_elevated_button.dart';

import '../widgets/appointment_request_card.dart';

class ClientAppointmentView extends GetView<ClientAppointmentController> {
  const ClientAppointmentView({super.key});

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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Gap(paddingTop),
                const Gap(26),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    'Appointment',
                    style: 20.0.medium,
                  ),
                ),
                const Gap(26),

                /// This is the appointment request card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryVariantGradient,
                      border: Border.all(
                        width: 2,
                        color: AppColors.white.withOpacity(0.24),
                      ),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: <Widget>[
                        Ink(
                          padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                          decoration: const BoxDecoration(
                            color: AppColors.black50,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(32),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Appointment Request',
                                style: 12.0.regular,
                              ),
                              const Gap(8),
                              Row(
                                children: <Widget>[
                                  const Icon(
                                    Icons.access_time,
                                    color: AppColors.primary,
                                  ),
                                  const Gap(6),
                                  Text(
                                    '8 Jul 2024, 10:30am - 10:45am',
                                    style: 16.0.regular,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                        /// This is the upcoming appointment request card
                        Ink(
                          padding: const EdgeInsets.fromLTRB(16, 24, 16, 20),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  const CircleAvatar(
                                    radius: 25,
                                    backgroundImage: const AssetImage(
                                      AppAssets.profilePictureDummy,
                                    ),
                                  ),
                                  const Gap(12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Edgar Howell',
                                        style: 18.0.semiBold,
                                      ),
                                      const Gap(4),
                                      Text(
                                        'UI/UX Design',
                                        style: 12.0.regular,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Gap(26),
                              Row(
                                children: <Widget>[
                                  _buildAppointmentButton(
                                    'Reschedule',
                                    onPressed: () {},
                                  ),
                                  const Gap(8),
                                  _buildAppointmentButton(
                                    'Reject',
                                    onPressed: () {},
                                  ),
                                  const Gap(8),
                                  _buildAppointmentButton(
                                    'Accept',
                                    onPressed: () {},
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(32),

                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    'Your appointments',
                    style: 16.0.medium,
                  ),
                ),
                const Gap(24),

                /// This is the appointment request card list
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Obx(() {
                    return Column(
                      children: <Widget>[
                        ...controller.appointments.map(
                          (Appointment appointment) => AppointmentRequestCard(
                            name:
                                '${appointment.freelancer?.firstName} ${appointment.freelancer?.lastName}',
                            dateTime:
                                '${appointment.date.toDate}, ${appointment.time.time.toDateTime.toTime}${appointment.time.type.name.toLowerCase()} - ${(appointment.time.time.toDateTime.add(Duration(minutes: appointment.time.duration))).toTime}${appointment.time.type.name.toLowerCase()}',
                          ),
                        ),
                      ],
                    );
                  }),
                ),

                const Gap(80),
              ],
            ),
          ),
        ),

        /// This is the add appointment button
        Positioned(
          bottom: 24,
          left: 24,
          right: 24,
          child: Material(
            type: MaterialType.transparency,
            child: AppElevatedButton(
              onPressed: controller.navigateToBookAppointmentDateChooser,
              child: Text(
                'Create New',
                style: 16.0.medium,
              ),
            ),
          ),
        )
      ],
    );
  }

  Expanded _buildAppointmentButton(
    String title, {
    void Function()? onPressed,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(32),
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.5,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.white.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: 12.0.semiBold,
            ),
          ),
        ),
      ),
    );
  }
}

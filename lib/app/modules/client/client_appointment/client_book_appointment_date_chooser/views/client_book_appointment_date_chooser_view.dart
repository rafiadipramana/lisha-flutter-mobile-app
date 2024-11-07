import 'dart:developer';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/client_book_appointment_date_chooser_controller.dart';
import '../../../../../extensions/text_styles/int_text_style_extension.dart';
import '../../../../../config/app_assets.dart';
import '../../../../../config/app_colors.dart';
import '../../../../../widgets/app_elevated_button.dart';

class ClientBookAppointmentDateChooserView
    extends GetView<ClientBookAppointmentDateChooserController> {
  const ClientBookAppointmentDateChooserView({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Gap(paddingTop),
                Image.asset(
                  AppAssets.appLogo,
                  width: 75,
                ),
                const Gap(24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Ink(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryVariantGradient,
                      border: Border.all(
                        width: 2,
                        color: AppColors.white.withOpacity(0.24),
                      ),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Book Appointment',
                          style: 24.0.regular,
                        ),
                        const Gap(24),
                        Ink(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.black50,
                            borderRadius: BorderRadius.circular(140),
                          ),
                          child: Row(
                            children: <Widget>[
                              const CircleAvatar(
                                radius: 45,
                                backgroundImage: AssetImage(
                                  AppAssets.profilePictureDummy,
                                ),
                              ),
                              const Gap(12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Lisa',
                                    style: 18.0.medium,
                                  ),
                                  const Gap(4),
                                  Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        AppAssets.clockIcon,
                                      ),
                                      const Gap(7),
                                      Text(
                                        '30 min',
                                        style: 16.0.regular.copyWith(
                                              color: AppColors.grey150,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Ink(
                    padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
                    decoration: BoxDecoration(
                      color: AppColors.black200,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: CalendarDatePicker2(
                      value: [],
                      onValueChanged: (List<DateTime>? selectedDate) {
                        log('Selected Date: $selectedDate');
                        if (selectedDate != null && selectedDate.isNotEmpty) {
                          controller.selectedDate = selectedDate.first;
                        }
                      },
                      config: CalendarDatePicker2Config(
                        calendarType: CalendarDatePicker2Type.single,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(3024),
                        currentDate: DateTime.now(),
                        calendarViewMode: CalendarDatePicker2Mode.day,
                        weekdayLabels: [
                          'SUN',
                          'MON',
                          'TUE',
                          'WED',
                          'THU',
                          'FRI',
                          'SAT',
                        ],
                        weekdayLabelTextStyle: 16.0.regular,
                        dayTextStyle: 16.0.regular,
                        dayBorderRadius: BorderRadius.circular(8),
                        monthTextStyle: 16.0.regular,
                        selectedMonthTextStyle: 16.0.regular,
                        controlsTextStyle: 18.0.medium,
                        daySplashColor: AppColors.primary,
                        selectedDayHighlightColor: AppColors.primary,
                        lastMonthIcon: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.grey150,
                        ),
                        nextMonthIcon: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.grey150,
                        ),
                        selectedDayTextStyle: 16.0.regular.copyWith(
                              color: AppColors.white,
                            ),
                        disableMonthPicker: true,
                      ),
                    ),
                  ),
                ),
                const Gap(8),
                Ink(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.black200,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            onTap: controller.back,
                            borderRadius: BorderRadius.circular(100),
                            child: SvgPicture.asset(
                              AppAssets.timepickerIcon,
                            ),
                          ),
                          const Gap(16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Select Time',
                                style: 16.0.regular,
                              ),
                              const Gap(4),
                              Obx(
                                () {
                                  return Text(
                                    '${controller.selectedTimeSlot.time} ${controller.selectedTimeSlot.type.name}',
                                    style: 16.0.regular.copyWith(
                                          color: AppColors.grey150,
                                        ),
                                  );
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                      const Gap(64),
                      InkWell(
                        onTap: controller.navigateToBookAppointmentTimeChooser,
                        borderRadius: BorderRadius.circular(100),
                        child: SvgPicture.asset(
                          AppAssets.nextIcon,
                        ),
                      ),
                    ],
                  ),
                ),
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
              onPressed: controller.navigateToBookAppointmentDetail,
              child: Text(
                'Continue',
                style: 16.0.medium,
              ),
            ),
          ),
        )
      ],
    );
  }
}

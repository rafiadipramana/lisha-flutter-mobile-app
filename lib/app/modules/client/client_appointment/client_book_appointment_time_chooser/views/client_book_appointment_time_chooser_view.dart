import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:lisha/app/config/app_assets.dart';
import 'package:lisha/app/config/app_colors.dart';
import 'package:lisha/app/extensions/date_time/date_time_extension.dart';
import 'package:lisha/app/extensions/text_styles/int_text_style_extension.dart';
import 'package:lisha/app/widgets/app_elevated_button.dart';
import 'package:lisha/app/widgets/shared/appointment_date_time_zone_card.dart';

import '../../../../../domain/entities/time_slot.dart';
import '../controllers/client_book_appointment_time_chooser_controller.dart';

class ClientBookAppointmentTimeChooserView
    extends GetView<ClientBookAppointmentTimeChooserController> {
  const ClientBookAppointmentTimeChooserView({super.key});
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.paddingOf(context).top;
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
          body: SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Gap(paddingTop),
                const Gap(32),
                Obx(() {
                  return AppointmentDateTimeZoneCard(
                    topContentText: controller.currentTime.format(context),
                    middleContentText: controller.selectedDate.dayName,
                    bottomContentText: controller.selectedDate.toShortDate,
                  );
                }),
                const Gap(48),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Ink(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.black200,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'AM',
                                    style: 18.0.regular,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'PM',
                                    style: 18.0.regular,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                _buildAppointmentTimeItem(
                                  dummyAfterMidnightTimeSlots,
                                ),
                                const Gap(8),
                                _buildAppointmentTimeItem(
                                  dummyPastMidnightTimeSlots,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(48),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: AppElevatedButton(
                    onPressed: controller.confirmTimeSlot,
                    child: Text(
                      'Confirm',
                      style: 16.0.medium,
                    ),
                  ),
                ),
                const Gap(60),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Expanded _buildAppointmentTimeItem(List<TimeSlot> timeSlots) {
    return Expanded(
      child: Material(
        color: AppColors.transparent,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final TimeSlot timeSlot = timeSlots[index];
            return Column(
              children: <Widget>[
                InkWell(
                  onTap: () => controller.selectedTimeSlot = timeSlot,
                  borderRadius: BorderRadius.circular(8),
                  child: Obx(
                    () {
                      return Ink(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: controller.selectedTimeSlot == timeSlot
                              ? AppColors.primary
                              : timeSlot.isAvailable
                                  ? AppColors.grey400
                                  : AppColors.grey150,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          timeSlot.time,
                          style: 18.0.regular,
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                ),
                const Gap(8),
              ],
            );
          },
          itemCount: timeSlots.length,
        ),
      ),
    );
  }
}

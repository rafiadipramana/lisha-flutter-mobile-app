import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:lisha/app/config/app_assets.dart';
import 'package:lisha/app/config/app_colors.dart';
import 'package:lisha/app/extensions/date_time/date_time_extension.dart';
import 'package:lisha/app/extensions/text_styles/int_text_style_extension.dart';
import 'package:lisha/app/widgets/app_elevated_button.dart';
import 'package:lisha/app/widgets/app_secondary_outlined_text_form_field.dart';
import 'package:lisha/app/widgets/shared/appointment_date_time_zone_card.dart';

import '../controllers/client_book_appointment_detail_controller.dart';

class ClientBookAppointmentDetailView
    extends GetView<ClientBookAppointmentDetailController> {
  const ClientBookAppointmentDetailView({super.key});
  @override
  Widget build(BuildContext context) {
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
          resizeToAvoidBottomInset: true,
          body: CustomScrollView(
            controller: controller.scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              PinnedHeaderSliver(
                child: Obx(() {
                  return AppointmentPinnedAppBar(
                    backgroundOpacity: controller.scrollOffset > 0 ? 0.5 : 0,
                    onBack: controller.back,
                  );
                }),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  const Gap(12),
                  AppointmentDateTimeZoneCard(
                    topContentText: 'Indochina Time',
                    // middleContentText: '09:30am-10:00am',
                    middleContentText:
                        '${controller.selectedTime.time}${controller.selectedTime.type.name.toLowerCase()}-${controller.selectedTime.addDuration(30).time}${controller.selectedTime.type.name.toLowerCase()}',
                    bottomContentText: controller.selectedDate.toFullDate,
                  ),
                  const Gap(46),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.grey50,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Information Detail',
                              style: 18.0.medium,
                            ),
                            const Gap(16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Full name',
                                  style: 16.0.regular.copyWith(
                                        color: AppColors.grey300,
                                      ),
                                ),
                                const Gap(8),
                                AppSecondaryOutlinedTextFormField(
                                  controller:
                                      controller.clientFullNameController,
                                  hintText: 'Enter your full name',
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your full name';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            const Gap(16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Email',
                                  style: 16.0.regular.copyWith(
                                        color: AppColors.grey300,
                                      ),
                                ),
                                const Gap(8),
                                AppSecondaryOutlinedTextFormField(
                                  controller: controller.clientEmailController,
                                  hintText: 'kimjun@example.com',
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    } else if (!GetUtils.isEmail(value)) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            const Gap(16),
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 12, 16, 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: AppColors.grey250,
                                ),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Theme(
                                    data: ThemeData(
                                      textSelectionTheme:
                                          TextSelectionThemeData(
                                        cursorColor:
                                            AppColors.white.withOpacity(0.8),
                                        selectionColor:
                                            AppColors.white.withOpacity(0.8),
                                        selectionHandleColor:
                                            AppColors.white.withOpacity(0.8),
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller:
                                          controller.invitedGuestsController,
                                      textInputAction: TextInputAction.done,
                                      onFieldSubmitted: (String? value) {
                                        if (value != null && value.isNotEmpty) {
                                          value = value.trim();
                                          if (!GetUtils.isEmail(value)) {
                                            Fluttertoast.showToast(
                                              msg:
                                                  'Please enter a valid email address',
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                              fontAsset:
                                                  'fonts/Manrope-Regular.ttf',
                                            );
                                          } else if (controller.invitedGuests
                                              .contains(value)) {
                                            Fluttertoast.showToast(
                                              msg: 'Guest already added',
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                              fontAsset:
                                                  'fonts/Manrope-Regular.ttf',
                                            );
                                          } else if (controller
                                                  .invitedGuests.length >=
                                              10) {
                                            Fluttertoast.showToast(
                                              msg:
                                                  'Maximum of 10 guests allowed',
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                              fontAsset:
                                                  'fonts/Manrope-Regular.ttf',
                                            );
                                          } else {
                                            controller.invitedGuests.add(value);
                                            controller.invitedGuestsController
                                                .clear();
                                            Fluttertoast.showToast(
                                              msg: 'Guest added',
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.green,
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                              fontAsset:
                                                  'fonts/Manrope-Regular.ttf',
                                            );
                                          }
                                        }
                                      },
                                      style: 16.0.regular.copyWith(
                                            color: AppColors.white,
                                          ),
                                      decoration: const InputDecoration(
                                        hintText: 'Guest (Optional)',
                                        hintStyle: TextStyle(
                                          color: AppColors.grey300,
                                        ),
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        isDense: true,
                                      ),
                                    ),
                                  ),
                                  Obx(() {
                                    return _buildGuestChipSizedBox(
                                      invitedGuests: controller.invitedGuests,
                                      onDeleted: (int index) {
                                        controller.invitedGuests
                                            .removeAt(index);
                                      },
                                    );
                                  }),
                                ],
                              ),
                            ),
                            const Gap(16),
                            Text(
                              '*Maximum of 10 additional guests scheduled.',
                              style: 14.0.regular.copyWith(
                                    color: AppColors.grey300,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.grey50,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Description (Optional)',
                            style: 16.0.regular.copyWith(
                                  color: AppColors.grey300,
                                ),
                          ),
                          const Gap(8),
                          Theme(
                            data: ThemeData(
                              textSelectionTheme: TextSelectionThemeData(
                                cursorColor: AppColors.white.withOpacity(0.8),
                                selectionColor:
                                    AppColors.white.withOpacity(0.8),
                                selectionHandleColor:
                                    AppColors.white.withOpacity(0.8),
                              ),
                            ),
                            child: TextFormField(
                              controller:
                                  controller.appointmentDescriptionController,
                              style: 16.0.regular.copyWith(
                                    color: AppColors.white,
                                  ),
                              maxLines: 3,
                              minLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Write a description',
                                hintStyle: TextStyle(
                                  color: AppColors.grey300,
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                isDense: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(40),
                ]),
              ),
            ],
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Material(
                type: MaterialType.transparency,
                child: AppElevatedButton(
                  onPressed: controller.addAppointment,
                  child: Text(
                    'Confirm',
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

  SizedBox _buildGuestChipSizedBox({
    required List<String> invitedGuests,
    Function(int index)? onDeleted,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        runSpacing: 0,
        children: <Widget>[
          ...invitedGuests.map(
            (String guest) {
              return Chip(
                onDeleted: onDeleted != null
                    ? () {
                        onDeleted(invitedGuests.indexOf(guest));
                      }
                    : null,
                deleteIcon: const Icon(
                  Icons.close,
                  color: AppColors.white,
                  size: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: BorderSide(
                  color: AppColors.white.withOpacity(0.06),
                ),
                backgroundColor: AppColors.tertiaryTransparent,
                surfaceTintColor: AppColors.transparent,
                label: Text(
                  guest,
                  style: 16.0.regular,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AppointmentPinnedAppBar extends StatelessWidget {
  const AppointmentPinnedAppBar({
    super.key,
    required this.backgroundOpacity,
    required this.onBack,
  });

  final double backgroundOpacity;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final double paddingTop = MediaQuery.paddingOf(context).top;
    return Material(
      type: MaterialType.transparency,
      child: ClipRect(
        child: BackdropFilter(
          filter: backgroundOpacity > 0
              ? ImageFilter.blur(sigmaX: 10, sigmaY: 10)
              : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Ink(
            decoration: BoxDecoration(
              color: AppColors.black.withOpacity(backgroundOpacity),
            ),
            child: Column(
              children: <Widget>[
                Gap(paddingTop),
                const Gap(16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: onBack,
                        borderRadius: BorderRadius.circular(40),
                        child: Ink(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.transparent,
                          ),
                          child: SvgPicture.asset(
                            AppAssets.arrowLeftIcon,
                          ),
                        ),
                      ),
                      const Gap(6),
                      Text(
                        'Book Appointment',
                        style: 24.0.secondaryRegular,
                      ),
                    ],
                  ),
                ),
                const Gap(12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

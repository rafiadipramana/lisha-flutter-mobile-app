import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lisha/app/domain/entities/appointment.dart';
import 'package:lisha/app/domain/entities/time_slot.dart';
import 'package:lisha/app/domain/use_cases/add_appointment_use_case.dart';
import 'package:lisha/app/extensions/date_time/date_time_extension.dart';
import 'package:lisha/app/routes/app_pages.dart';

class ClientBookAppointmentDetailController extends GetxController {
  late final TextEditingController _clientFullNameController;
  TextEditingController get clientFullNameController =>
      _clientFullNameController;

  late final TextEditingController _clientEmailController;
  TextEditingController get clientEmailController => _clientEmailController;

  late final TextEditingController _invitedGuestsController;
  TextEditingController get invitedGuestsController => _invitedGuestsController;

  late final RxList<String> _invitedGuests;
  List<String> get invitedGuests => _invitedGuests;

  late final TextEditingController _appointmentDescriptionController;
  TextEditingController get appointmentDescriptionController =>
      _appointmentDescriptionController;

  /// This properties are used to track custom scroll view position
  late final ScrollController _scrollController;
  ScrollController get scrollController => _scrollController;

  final RxDouble _scrollOffset = 0.0.obs;
  double get scrollOffset => _scrollOffset.value;

  /// This properties are received from the previous screen
  /// Contained the selected date, time, and freelancer id
  late final DateTime _selectedDate;
  DateTime get selectedDate => _selectedDate;

  late final TimeSlot _selectedTime;
  TimeSlot get selectedTime => _selectedTime;

  late final String _freelancerId;
  String get freelancerId => _freelancerId;

  late final GlobalKey<FormState> _formKey;
  GlobalKey<FormState> get formKey => _formKey;

  @override
  void onInit() {
    _selectedDate = Get.arguments['selectedDate'] as DateTime;
    _selectedTime = Get.arguments['selectedTime'] as TimeSlot;
    // _freelancerId = Get.arguments['freelancerId'];
    _freelancerId = '6cbcab48-5b3e-4276-b4ff-9abedcb0d8f1';

    /// Initialize the scroll controller
    /// and add listener to track the scroll offset
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _scrollOffset.value = _scrollController.offset;
      log('Scroll offset: $scrollOffset');
    });


    _clientFullNameController = TextEditingController();
    _clientEmailController = TextEditingController();
    _invitedGuestsController = TextEditingController();
    _invitedGuests = <String>[].obs;
    _appointmentDescriptionController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.onInit();
  }

  Future<void> addAppointment() async {
    if (formKey.currentState!.validate()) {
      final AddAppointmentUseCase addAppointmentUseCase =
          Get.find<AddAppointmentUseCase>();
      try {
        final Appointment newAppointment = await addAppointmentUseCase.execute(
          Appointment(
            freelancerId: freelancerId,
            // TODO: Fix duration
            time: selectedTime.copyWith(
              duration: 30,
            ),
            date: selectedDate,
            fullName: clientFullNameController.text,
            email: clientEmailController.text,
          ),
        ).then((value) => value.first);
        navigateToClientBookAppointmentSucceed(
          newAppointment,
        );
      } catch (e) {
        rethrow;
      }
    }
  }

  void navigateToClientBookAppointmentSucceed(Appointment appointment) {
    Get.offNamedUntil(
      Routes.CLIENT_BOOK_APPOINTMENT_SUCCEED,
      (route) => route.settings.name == Routes.ROOT,
      arguments: appointment,
    );
  }

  void back() => Get.back();
}

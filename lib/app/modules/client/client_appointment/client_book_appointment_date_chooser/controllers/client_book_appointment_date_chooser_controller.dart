import 'dart:developer';

import 'package:get/get.dart';
import 'package:lisha/app/domain/entities/time_slot.dart';
import 'package:lisha/app/routes/app_pages.dart';

class ClientBookAppointmentDateChooserController extends GetxController {
  late final Rx<TimeSlot> _selectedTimeSlot;
  TimeSlot get selectedTimeSlot => _selectedTimeSlot.value;
  set selectedTimeSlot(TimeSlot value) => _selectedTimeSlot.value = value;

  late final Rx<DateTime> _selectedDate;
  DateTime get selectedDate => _selectedDate.value;
  set selectedDate(DateTime value) => _selectedDate.value = value;

  @override
  void onInit() {
    super.onInit();
    _selectedTimeSlot = TimeSlot.empty().obs;
    _selectedDate = DateTime.now().obs;
  }

  void navigateToBookAppointmentTimeChooser() async {
    final pickedTimeSlot = await Get.toNamed(Routes.CLIENT_BOOK_APPOINTMENT_TIME_CHOOSER, arguments: selectedDate);
    if (pickedTimeSlot != null) {
      selectedTimeSlot = pickedTimeSlot;
    }
  }

  void navigateToBookAppointmentDetail() {
    log('selectedDate: $selectedDate');
    Get.toNamed(Routes.CLIENT_BOOK_APPOINTMENT_DETAIL, arguments: {
      'selectedDate': selectedDate,
      'selectedTime': selectedTimeSlot,
    });
  }

  void back() {
    Get.back();
  }
}

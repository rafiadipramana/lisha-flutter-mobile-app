import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lisha/app/domain/entities/time_slot.dart';

class ClientBookAppointmentTimeChooserController extends GetxController {
  late final Rxn<TimeSlot> _selectedTimeSlot;
  TimeSlot? get selectedTimeSlot => _selectedTimeSlot.value;
  set selectedTimeSlot(TimeSlot? value) => _selectedTimeSlot.value = value;

  late final DateTime _selectedDate;
  DateTime get selectedDate => _selectedDate;

  late final Rx<TimeOfDay> _currentTime;
  TimeOfDay get currentTime => _currentTime.value;

  @override
  void onInit() {
    super.onInit();
    /// Catch arguments from previous screen
    _selectedDate = Get.arguments as DateTime;
    
    _selectedTimeSlot = Rxn<TimeSlot>();

    _currentTime = TimeOfDay.now().obs;
    /// Stream to update the current time like a real-time clock
    _currentTime.bindStream(Stream.periodic(const Duration(seconds: 1), (int _) {
      log('Updating current time to ${TimeOfDay.now()}');
      return TimeOfDay.now();
    }));
  }

  void confirmTimeSlot() {
    if (selectedTimeSlot != null) {
      Get.back(result: selectedTimeSlot);
    } else {
      Get.back();
    }
  }

  @override
  void onClose() {
    _currentTime.close();
    super.onClose();
  }
}

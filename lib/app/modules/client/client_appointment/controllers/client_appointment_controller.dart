import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:lisha/app/domain/entities/appointment.dart';
import 'package:lisha/app/domain/use_cases/get_client_appointments_use_case.dart';
import 'package:lisha/app/global/navigation_service.dart';
import '../../../../routes/app_pages.dart';

class ClientAppointmentController extends GetxController {
  late final RxList<Appointment> _appointments;
  List<Appointment> get appointments => _appointments;

  @override
  void onInit() {
    super.onInit();
    _appointments = <Appointment>[].obs;
  }

  @override
  void onReady() {
    super.onReady();
    getClientAppointments();
  }

  Future<void> getClientAppointments() async {
    try {
      final GetClientAppointmentsUseCase getClientAppointmentsUseCase = Get.find<GetClientAppointmentsUseCase>();
      _appointments.value = await getClientAppointmentsUseCase.execute();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> navigateToBookAppointmentDateChooser() async {
    final Completer<bool> completer = Completer<bool>();
    NavigationService.setCompleter('result', completer);
    log('Start Completer');

    Get.toNamed(Routes.CLIENT_BOOK_APPOINTMENT_DATE_CHOOSER);

    final bool result = await completer.future;
    if (result) {
      getClientAppointments();
    }
  }
}

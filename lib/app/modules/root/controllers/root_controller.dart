import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lisha/app/domain/use_cases/get_user_data_use_case.dart';
import 'package:lisha/app/modules/client/client_appointment/views/client_appointment_view.dart';
import 'package:lisha/app/modules/client/client_home/views/client_home_view.dart';
import 'package:lisha/app/modules/client/service/views/service_view.dart';
import 'package:lisha/app/modules/freelancer/freelancer_appointment/views/freelancer_appointment_view.dart';
import 'package:lisha/app/modules/freelancer/freelancer_chat/views/freelancer_chat_view.dart';
import 'package:lisha/app/modules/freelancer/freelancer_profile/views/freelancer_profile_view.dart';
import 'package:lisha/app/modules/freelancer/freelancer_service/views/freelancer_service_view.dart';
import 'package:lisha/app/modules/freelancer/home/views/home_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RootController extends GetxController {
  final RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;

  late final PageController _pageController;
  PageController get pageController => _pageController;

  final Rxn<User> _user = Rxn<User>();
  User? get user => _user.value;

  final List<Widget> _freelancerPages = const <Widget>[
    HomeView(),
    FreelancerAppointmentView(),
    FreelancerServiceView(),
    FreelancerChatView(),
    FreelancerProfileView(),
  ];
  List<Widget> get freelancerPages => _freelancerPages;

  final List<Widget> _clientPages = const <Widget>[
    ClientHomeView(),
    ClientAppointmentView(),
    ServiceView(),
    FreelancerChatView(),
    FreelancerProfileView(),
  ];
  List<Widget> get clientPages => _clientPages;

  @override
  void onInit() {
    _pageController = PageController();
    _user.value = Get.find<GetUserDataUseCase>().execute();
    super.onInit();
  }

  changePage(int index) {
    _currentIndex.value = index;
    _pageController.jumpToPage(index);
  }
}

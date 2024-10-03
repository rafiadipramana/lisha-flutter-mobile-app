import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lisha/app/modules/freelancer/freelancer_appointment/views/freelancer_appointment_view.dart';
import 'package:lisha/app/modules/freelancer/freelancer_chat/views/freelancer_chat_view.dart';
import 'package:lisha/app/modules/freelancer/freelancer_profile/views/freelancer_profile_view.dart';
import 'package:lisha/app/modules/freelancer/freelancer_service/views/freelancer_service_view.dart';
import 'package:lisha/app/modules/freelancer/home/views/home_view.dart';

class RootController extends GetxController {
  final RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;

  late final PageController _pageController;
  PageController get pageController => _pageController;

  final List<Widget> _pages = const <Widget>[
    HomeView(),
    FreelancerAppointmentView(),
    FreelancerServiceView(),
    FreelancerChatView(),
    FreelancerProfileView(),
  ];
  List<Widget> get pages => _pages;

  @override
  void onInit() {
    _pageController = PageController();
    super.onInit();
  }

  changePage(int index) {
    _currentIndex.value = index;
    _pageController.jumpToPage(index);
  }
}

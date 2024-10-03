import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../modules/client/appointment/bindings/appointment_binding.dart';
import '../modules/client/appointment/views/appointment_view.dart';
import '../modules/client/service/bindings/service_binding.dart';
import '../modules/client/service/views/service_view.dart';
import '../modules/common/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/common/forgot_password/views/forgot_password_view.dart';
import '../modules/common/login/bindings/login_binding.dart';
import '../modules/common/login/views/login_view.dart';
import '../modules/common/register/bindings/register_binding.dart';
import '../modules/common/register/views/register_view.dart';
import '../modules/common/splash/bindings/splash_binding.dart';
import '../modules/common/splash/views/splash_view.dart';
import '../modules/freelancer/add_portfolio/bindings/add_portfolio_binding.dart';
import '../modules/freelancer/add_portfolio/views/add_portfolio_view.dart';
import '../modules/freelancer/edit_portfolio/bindings/edit_portfolio_binding.dart';
import '../modules/freelancer/edit_portfolio/views/edit_portfolio_view.dart';
import '../modules/freelancer/freelancer_appointment/bindings/freelancer_appointment_binding.dart';
import '../modules/freelancer/freelancer_appointment/views/freelancer_appointment_view.dart';
import '../modules/freelancer/freelancer_chat/bindings/freelancer_chat_binding.dart';
import '../modules/freelancer/freelancer_chat/freelancer_chatroom/bindings/freelancer_chatroom_binding.dart';
import '../modules/freelancer/freelancer_chat/freelancer_chatroom/views/freelancer_chatroom_view.dart';
import '../modules/freelancer/freelancer_chat/views/freelancer_chat_view.dart';
import '../modules/freelancer/freelancer_profile/bindings/freelancer_profile_binding.dart';
import '../modules/freelancer/freelancer_profile/views/freelancer_profile_view.dart';
import '../modules/freelancer/freelancer_service/add_freelancer_service/bindings/add_freelancer_service_binding.dart';
import '../modules/freelancer/freelancer_service/add_freelancer_service/views/add_freelancer_service_view.dart';
import '../modules/freelancer/freelancer_service/bindings/freelancer_service_binding.dart';
import '../modules/freelancer/freelancer_service/edit_freelancer_service/bindings/edit_freelancer_service_binding.dart';
import '../modules/freelancer/freelancer_service/edit_freelancer_service/views/edit_freelancer_service_view.dart';
import '../modules/freelancer/freelancer_service/views/freelancer_service_view.dart';
import '../modules/freelancer/home/bindings/home_binding.dart';
import '../modules/freelancer/home/views/home_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.fade,
      transitionDuration: Durations.medium1,
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
      curve: Curves.easeIn,
      transition: Transition.fade,
      transitionDuration: Durations.medium1,
    ),
    GetPage(
      name: _Paths.ROOT,
      page: () => const RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.APPOINTMENT,
      page: () => const AppointmentView(),
      binding: AppointmentBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PORTFOLIO,
      page: () => const AddPortfolioView(),
      binding: AddPortfolioBinding(),
    ),
    GetPage(
      name: _Paths.SERVICE,
      page: () => const ServiceView(),
      binding: ServiceBinding(),
    ),
    GetPage(
      name: _Paths.FREELANCER_SERVICE,
      page: () => const FreelancerServiceView(),
      binding: FreelancerServiceBinding(),
      children: [
        GetPage(
          name: _Paths.ADD_FREELANCER_SERVICE,
          page: () => const AddFreelancerServiceView(),
          binding: AddFreelancerServiceBinding(),
        ),
        GetPage(
          name: _Paths.EDIT_FREELANCER_SERVICE,
          page: () => const EditFreelancerServiceView(),
          binding: EditFreelancerServiceBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.FREELANCER_CHAT,
      page: () => const FreelancerChatView(),
      binding: FreelancerChatBinding(),
      children: [
        GetPage(
          name: _Paths.FREELANCER_CHATROOM,
          page: () => const FreelancerChatroomView(),
          binding: FreelancerChatroomBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FREELANCER_PROFILE,
      page: () => const FreelancerProfileView(),
      binding: FreelancerProfileBinding(),
    ),
    GetPage(
      name: _Paths.FREELANCER_APPOINTMENT,
      page: () => const FreelancerAppointmentView(),
      binding: FreelancerAppointmentBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PORTFOLIO,
      page: () => const EditPortfolioView(),
      binding: EditPortfolioBinding(),
    ),
  ];
}

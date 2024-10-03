import 'package:get/get.dart';
import 'package:lisha/app/data/data_sources/remote/appointment_remote_data_source.dart';
import 'package:lisha/app/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:lisha/app/data/data_sources/remote/chat_remote_data_source.dart';
import 'package:lisha/app/data/data_sources/remote/conversation_remote_data_source.dart';
import 'package:lisha/app/data/data_sources/remote/marketing_service_remote_data_source.dart';
import 'package:lisha/app/data/data_sources/remote/portfolio_remote_data_source.dart';
import 'package:lisha/app/data/data_sources/remote/user_remote_data_source.dart';
import 'package:lisha/app/data/repositories/auth_repository_impl.dart';
import 'package:lisha/app/data/repositories/marketing_service_repository_impl.dart';
import 'package:lisha/app/data/repositories/user_repository_impl.dart';
import 'package:lisha/app/domain/repositories/auth_repository.dart';
import 'package:lisha/app/domain/repositories/chat_repository.dart';
import 'package:lisha/app/domain/repositories/conversation_repository.dart';
import 'package:lisha/app/domain/repositories/marketing_service_repository.dart';
import 'package:lisha/app/domain/repositories/portfolio_repository.dart';
import 'package:lisha/app/domain/repositories/user_repository.dart';
import 'package:lisha/app/domain/use_cases/add_chat_use_case.dart';
import 'package:lisha/app/domain/use_cases/add_freelancer_marketing_service_use_case.dart';
import 'package:lisha/app/domain/use_cases/add_portfolio_use_case.dart';
import 'package:lisha/app/domain/use_cases/check_login_status_use_case.dart';
import 'package:lisha/app/domain/use_cases/delete_freelancer_marketing_service_image_use_case.dart';
import 'package:lisha/app/domain/use_cases/delete_freelancer_marketing_service_use_case.dart';
import 'package:lisha/app/domain/use_cases/delete_freelancer_portfolio_image_use_case.dart';
import 'package:lisha/app/domain/use_cases/delete_freelancer_portfolio_use_case.dart';
import 'package:lisha/app/domain/use_cases/get_chats_by_conversation_id_use_case.dart';
import 'package:lisha/app/domain/use_cases/get_conversation_use_case.dart';
import 'package:lisha/app/domain/use_cases/get_freelancer_appointments_use_case.dart';
import 'package:lisha/app/domain/use_cases/get_freelancer_marketing_service_by_id_use_case.dart';
import 'package:lisha/app/domain/use_cases/get_freelancer_marketing_services_use_case.dart';
import 'package:lisha/app/domain/use_cases/get_freelancer_portfolio_by_id_use_case.dart';
import 'package:lisha/app/domain/use_cases/get_freelancer_portfolios_use_case.dart';
import 'package:lisha/app/domain/use_cases/get_portfolio_categories_use_case.dart';
import 'package:lisha/app/domain/use_cases/get_user_data_use_case.dart';
import 'package:lisha/app/domain/use_cases/login_use_case.dart';
import 'package:lisha/app/domain/use_cases/logout_use_case.dart';
import 'package:lisha/app/domain/use_cases/reset_password_by_email_use_case.dart';
import 'package:lisha/app/domain/use_cases/sign_up_use_case.dart';
import 'package:lisha/app/data/repositories/portfolio_repository_impl.dart';
import 'package:lisha/app/domain/use_cases/update_freelancer_marketing_service_use_case.dart';
import 'package:lisha/app/domain/use_cases/update_freelancer_portfolio_use_case.dart';
import 'package:lisha/app/domain/use_cases/upload_freelancer_marketing_service_image_use_case.dart';
import 'package:lisha/app/domain/use_cases/upload_portfolio_image_use_case.dart';

import '../data/repositories/appointment_repository_impl.dart';
import '../data/repositories/chat_repository_impl.dart';
import '../data/repositories/conversation_repository_impl.dart';
import '../domain/repositories/appointment_repository.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRemoteDataSource>(() => AuthRemoteDataSource(), fenix: true);
    Get.lazyPut<UserRemoteDataSource>(() => UserRemoteDataSource(), fenix: true);
    Get.lazyPut<PortfolioRemoteDataSource>(() => PortfolioRemoteDataSource(), fenix: true);
    Get.lazyPut<AppointmentRemoteDataSource>(() => AppointmentRemoteDataSource(), fenix: true);
    Get.lazyPut<ConversationRemoteDataSource>(() => ConversationRemoteDataSource(), fenix: true);
    Get.lazyPut<ChatRemoteDataSource>(() => ChatRemoteDataSource(), fenix: true);
    Get.lazyPut<MarketingServiceRemoteDataSource>(() => MarketingServiceRemoteDataSource(), fenix: true);

    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(authRemoteDataSource: Get.find()), fenix: true);
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(userRemoteDataSource: Get.find()), fenix: true);
    Get.lazyPut<PortfolioRepository>(() => PortfolioRepositoryImpl(portfolioRemoteDataSource: Get.find()), fenix: true);
    Get.lazyPut<AppointmentRepository>(() => AppointmentRepositoryImpl(appointmentRemoteDataSource: Get.find()), fenix: true);
    Get.lazyPut<ConversationRepository>(() => ConversationRepositoryImpl(conversationRemoteDataSource: Get.find()), fenix: true);
    Get.lazyPut<ChatRepository>(() => ChatRepositoryImpl(chatRemoteDataSource: Get.find()), fenix: true);
    Get.lazyPut<MarketingServiceRepository>(() => MarketingServiceRepositoryImpl(marketingServiceRemoteDataSource: Get.find()), fenix: true);

    Get.lazyPut<LoginUseCase>(() => LoginUseCase(authRepository: Get.find()), fenix: true);
    Get.lazyPut<LogoutUseCase>(() => LogoutUseCase(authRepository: Get.find()), fenix: true);
    Get.lazyPut<SignUpUseCase>(() => SignUpUseCase(authRepository: Get.find()), fenix: true);
    Get.lazyPut<ResetPasswordByEmailUseCase>(() => ResetPasswordByEmailUseCase(authRepository: Get.find()), fenix: true);

    Get.lazyPut<CheckLoginStatusUsecase>(() => CheckLoginStatusUsecase(userRepository: Get.find()), fenix: true);
    Get.lazyPut<GetUserDataUseCase>(() => GetUserDataUseCase(userRepository: Get.find()), fenix: true);

    Get.lazyPut<GetFreelancerPortfolioByIdUseCase>(() => GetFreelancerPortfolioByIdUseCase(portfolioRepository: Get.find()), fenix: true);
    Get.lazyPut<GetFreelancerPortfoliosUseCase>(() => GetFreelancerPortfoliosUseCase(portfolioRepository: Get.find()), fenix: true);
    Get.lazyPut<AddPortfolioUseCase>(() => AddPortfolioUseCase(portfolioRepository: Get.find()), fenix: true);
    Get.lazyPut<GetPortfolioCategoriesUseCase>(() => GetPortfolioCategoriesUseCase(portfolioRepository: Get.find()), fenix: true);
    Get.lazyPut<UploadPortfolioImageUseCase>(() => UploadPortfolioImageUseCase(portfolioRepository: Get.find()), fenix: true);
    Get.lazyPut<UpdateFreelancerPortfolioUseCase>(() => UpdateFreelancerPortfolioUseCase(portfolioRepository: Get.find()), fenix: true);
    Get.lazyPut<DeleteFreelancerPortfolioImageUseCase>(() => DeleteFreelancerPortfolioImageUseCase(portfolioRepository: Get.find()), fenix: true);
    Get.lazyPut<DeleteFreelancerPortfolioUseCase>(() => DeleteFreelancerPortfolioUseCase(portfolioRepository: Get.find()), fenix: true);

    Get.lazyPut<GetFreelancerAppointmentsUseCase>(() => GetFreelancerAppointmentsUseCase(appointmentRepository: Get.find()), fenix: true);

    Get.lazyPut<GetConversationUseCase>(() => GetConversationUseCase(conversationRepository: Get.find()), fenix: true);

    Get.lazyPut<GetChatsByConversationIdUseCase>(() => GetChatsByConversationIdUseCase(chatRepository: Get.find()), fenix: true);
    Get.lazyPut<AddChatUseCase>(() => AddChatUseCase(chatRepository: Get.find()), fenix: true);

    Get.lazyPut<UploadFreelancerMarketingServiceImageUseCase>(() => UploadFreelancerMarketingServiceImageUseCase(marketingServiceRepository: Get.find()), fenix: true);
    Get.lazyPut<AddFreelancerMarketingServiceUseCase>(() => AddFreelancerMarketingServiceUseCase(marketingServiceRepository: Get.find()), fenix: true);
    Get.lazyPut<GetFreelancerMarketingServicesUseCase>(() => GetFreelancerMarketingServicesUseCase(marketingServiceRepository: Get.find()), fenix: true);
    Get.lazyPut<GetFreelancerMarketingServiceByIdUseCase>(() => GetFreelancerMarketingServiceByIdUseCase(marketingServiceRepository: Get.find()), fenix: true);
    Get.lazyPut<UpdateFreelancerMarketingServiceUseCase>(() => UpdateFreelancerMarketingServiceUseCase(marketingServiceRepository: Get.find()), fenix: true);
    Get.lazyPut<DeleteFreelancerMarketingServiceUseCase>(() => DeleteFreelancerMarketingServiceUseCase(marketingServiceRepository: Get.find()), fenix: true);
    Get.lazyPut<DeleteFreelancerMarketingServiceImageUseCase>(() => DeleteFreelancerMarketingServiceImageUseCase(marketingServiceRepository: Get.find()), fenix: true);
  }
}
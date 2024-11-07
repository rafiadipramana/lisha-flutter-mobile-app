import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lisha/app/domain/entities/portfolio.dart';
import 'package:lisha/app/domain/entities/portfolio_category.dart';
import 'package:lisha/app/domain/use_cases/delete_freelancer_portfolio_image_use_case.dart';
import 'package:lisha/app/domain/use_cases/delete_freelancer_portfolio_use_case.dart';
import 'package:lisha/app/domain/use_cases/get_user_data_use_case.dart';
import 'package:lisha/app/routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../data/services/supabase_service.dart';
import '../../../../domain/use_cases/get_freelancer_portfolios_use_case.dart';
import '../../../../widgets/app_confirmation_dialog.dart';

class HomeController extends GetxController {
  late final ScrollController _scrollController;

  ScrollController get scrollController => _scrollController;

  late final Rx<double> scrollStream;

  final Rxn<User> _user = Rxn<User>();

  User? get user => _user.value;

  final RxList<Portfolio> _portfolios = <Portfolio>[].obs;

  List<Portfolio> get portfolios => _portfolios;

  final RxList<Portfolio> _filteredPortfolios = <Portfolio>[].obs;

  List<Portfolio> get filteredPortfolios => _filteredPortfolios;

  final RxList<PortfolioCategory> _portfolioCategories =
      <PortfolioCategory>[].obs;

  List<PortfolioCategory> get portfolioCategories => _portfolioCategories;

  final RxnInt _selectedCategoryId = RxnInt();

  int? get selectedCategoryIndex => _selectedCategoryId.value;

  @override
  void onInit() {
    _scrollController = ScrollController();
    scrollStream = 0.0.obs;
    _initScrollListener();
    _user.value = Get.find<GetUserDataUseCase>().execute();
    super.onInit();
  }

  @override
  void onReady() async {
    await getFreelancerPortfolios();
    super.onReady();
  }

  @override
  void onClose() {
    _scrollController.dispose();
    super.onClose();
  }

  _initScrollListener() {
    scrollStream.bindStream(
        Stream.periodic(const Duration(milliseconds: 100)).map((_) {
          return _scrollController.hasClients ? _scrollController.offset : 0.0;
        })
    );
  }

  Future<void> navigateToAddPortfolio() async {
    final result = await Get.toNamed(Routes.ADD_PORTFOLIO);
    if (result != null) {
      await getFreelancerPortfolios();
    }
  }

  Future<void> getFreelancerPortfolios() async {
    final getFreeLancerPortfoliosUseCase =
        Get.find<GetFreelancerPortfoliosUseCase>();
    final portfolios = await getFreeLancerPortfoliosUseCase.execute();
    _portfolios.assignAll(portfolios);
    getPortfolioCategories();
    getPortfolioByCategoryId(portfolioCategories.first.id);
  }

  void getPortfolioByCategoryId(int id) {
    _selectedCategoryId.value = id;
    _filteredPortfolios.assignAll(
        portfolios.where((portfolio) => portfolio.category.id == id).toList());
  }

  void getPortfolioCategories() {
    _portfolioCategories.assignAll(portfolios
        .map((portfolio) => portfolio.category)
        .toSet()
        .map((category) =>
            PortfolioCategory(id: category.id, name: category.name))
        .toList());
  }

  Future<void> onRefresh() async {
    await getFreelancerPortfolios();
  }

  /// This function is used to navigate to the edit portfolio screen
  /// and update the portfolio list after editing
  /// [portfolio] is the portfolio to be edited
  /// [result] is the result of the edit portfolio screen
  /// if the result is not null, the portfolio list will be updated
  /// with the new portfolio list
  Future<void> navigateToEditPortfolio(Portfolio portfolio) async {
    final result = await Get.toNamed(
      Routes.EDIT_PORTFOLIO,
      arguments: portfolio,
    );
    if (result != null) {
      await getFreelancerPortfolios();
    }
  }

  /// This function is used to delete specific portfolio
  /// [portfolio] is the portfolio to be deleted
  /// if the portfolio is deleted successfully, the portfolio list will be updated
  /// with the new portfolio list

  void displayDeleteConfirmationDialog({
    required Portfolio portfolio,
  }) {
    Get.dialog(
      AppConfirmationDialog(
        confirmationMessage: 'Are you sure you want to delete this portfolio?',
        confirmButtonText: 'Delete',
        cancelButtonText: 'Cancel',
        onConfirm: () async {
          await deletePortfolio(portfolio: portfolio);
          Get.back();
        },
        onCancel: () {
          Get.back();
        },
      ),
    );
  }

  Future<void> deletePortfolio({
    required Portfolio portfolio,
  }) async {
    final deleteFreelancerPortfolioUseCase =
    Get.find<DeleteFreelancerPortfolioUseCase>();
    final deleteFreelancerPortfolioImageUseCase =
    Get.find<DeleteFreelancerPortfolioImageUseCase>();
    try {
      if (portfolio.imageUrl != null) {
        await deleteFreelancerPortfolioImageUseCase.execute(
          userId: SupabaseService.userId!,
          imageUrl: portfolio.imageUrl!,
        );
      }
      await deleteFreelancerPortfolioUseCase.execute(portfolio);
      await getFreelancerPortfolios();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to delete freelancer portfolio',
        snackPosition: SnackPosition.BOTTOM,
      );
      rethrow;
    }
  }
}

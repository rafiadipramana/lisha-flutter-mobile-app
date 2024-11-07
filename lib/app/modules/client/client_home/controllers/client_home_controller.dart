import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lisha/app/domain/entities/portfolio.dart';
import 'package:lisha/app/domain/use_cases/get_freelancer_portfolios_by_freelancer_id_use_case.dart';

import '../../../../domain/entities/portfolio_category.dart';

class ClientHomeController extends GetxController {
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();
  DraggableScrollableController get draggableScrollableController =>
      _draggableScrollableController;

  final RxDouble _scrollValue = 0.0.obs;
  double get scrollValue => _scrollValue.value;

  final RxDouble _gridViewScrollValue = 0.0.obs;
  double get gridViewScrollValue => _gridViewScrollValue.value;
  set gridViewScrollValue(double value) => _gridViewScrollValue.value = value;

  final RxList<Portfolio> _freelancerPortfolios = <Portfolio>[].obs;
  List<Portfolio> get freelancerPortfolios => _freelancerPortfolios;

  final RxList<Portfolio> _filteredPortfolios = <Portfolio>[].obs;
  List<Portfolio> get filteredPortfolios => _filteredPortfolios;

  final RxList<PortfolioCategory> _freelancerPortfolioCategories =
      <PortfolioCategory>[].obs;
  List<PortfolioCategory> get freelancerPortfolioCategories =>
      _freelancerPortfolioCategories;

  final RxnInt _selectedfreelancerPortfolioCategoryId = RxnInt();
  int? get selectedfreelancerPortfolioCategoryIndex =>
      _selectedfreelancerPortfolioCategoryId.value;

  @override
  void onInit() {
    if (draggableScrollableController.isAttached) {
      _scrollValue.bindStream(
        Stream.value(_draggableScrollableController.size),
      );
    }
    super.onInit();
  }

  @override
  void onReady() {
    _getFreelancerPortfoliosByFreelancerId();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> _getFreelancerPortfoliosByFreelancerId() async {
    try {
      final GetFreelancerPortfoliosByFreelancerIdUseCase
          getFreelancerPortfoliosByFreelancerIdUseCase =
          Get.find<GetFreelancerPortfoliosByFreelancerIdUseCase>();
      _freelancerPortfolios.assignAll(
        await getFreelancerPortfoliosByFreelancerIdUseCase.execute(),
      );
      getPortfolioCategories();
      getPortfolioByCategoryId(freelancerPortfolioCategories.first.id);
    } catch (e) {
      log(e.toString());
      Get.snackbar(
        'Error',
        'Failed to get freelancer portfolios',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void getPortfolioByCategoryId(int id) {
    _selectedfreelancerPortfolioCategoryId.value = id;
    _filteredPortfolios.assignAll(
      _freelancerPortfolios
          .where((portfolio) => portfolio.category.id == id)
          .toList(),
    );
  }

  void getPortfolioCategories() {
    _freelancerPortfolioCategories.assignAll(_freelancerPortfolios
        .map((portfolio) => portfolio.category)
        .toSet()
        .map((category) =>
            PortfolioCategory(id: category.id, name: category.name))
        .toList());
  }
}

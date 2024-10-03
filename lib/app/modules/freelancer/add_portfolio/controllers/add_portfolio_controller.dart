import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lisha/app/data/services/supabase_service.dart';
import 'package:lisha/app/domain/entities/portfolio.dart';
import 'package:lisha/app/domain/use_cases/get_portfolio_categories_use_case.dart';
import 'package:lisha/app/widgets/app_confirmation_dialog.dart';

import '../../../../domain/entities/portfolio_category.dart';
import '../../../../domain/use_cases/add_portfolio_use_case.dart';
import '../../../../domain/use_cases/upload_portfolio_image_use_case.dart';

class AddPortfolioController extends GetxController {
  late final RxList<PortfolioCategory> _portfolioCategories;
  List<PortfolioCategory> get portfolioCategories => _portfolioCategories;

  late final Rxn<PortfolioCategory> _selectedPortfolioCategory;
  set selectedPortfolioCategory(PortfolioCategory? value) =>
      _selectedPortfolioCategory.value = value;
  PortfolioCategory? get selectedPortfolioCategory =>
      _selectedPortfolioCategory.value;

  late final TextEditingController _portfolioTitleController;
  TextEditingController get portfolioTitleController =>
      _portfolioTitleController;

  late final TextEditingController _portfolioDescriptionController;
  TextEditingController get portfolioDescriptionController =>
      _portfolioDescriptionController;

  late final Rx<File> _portfolioImage;
  File get portfolioImage => _portfolioImage.value;

  @override
  void onInit() {
    _portfolioCategories = <PortfolioCategory>[].obs;
    _selectedPortfolioCategory = Rxn<PortfolioCategory>();
    _portfolioTitleController = TextEditingController();
    _portfolioDescriptionController = TextEditingController();
    _portfolioImage = File('').obs;
    super.onInit();
  }

  @override
  void onReady() async {
    final getPortfolioCategoriesUseCase =
        Get.find<GetPortfolioCategoriesUseCase>();
    _portfolioCategories
        .assignAll(await getPortfolioCategoriesUseCase.execute());
    super.onReady();
  }

  @override
  void onClose() {
    _portfolioTitleController.dispose();
    _portfolioDescriptionController.dispose();
    super.onClose();
  }

  Future<void> addPortfolio() async {
    final addPortfolioUseCase = Get.find<AddPortfolioUseCase>();
    final uploadPortfolioImageUseCase = Get.find<UploadPortfolioImageUseCase>();
    try {
      final portfolioImage = await uploadPortfolioImageUseCase.execute(
        userId: SupabaseService.userId!,
        imageFile: _portfolioImage.value,
      );
      await addPortfolioUseCase.execute(
        Portfolio(
          title: portfolioTitleController.text,
          description: portfolioDescriptionController.text,
          imageUrl: portfolioImage,
          category: selectedPortfolioCategory!,
        ),
      );
      Get.back(result: true);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add portfolio',
        snackPosition: SnackPosition.BOTTOM,
      );
      rethrow;
    }
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _portfolioImage.value = File(pickedFile.path);
    }
  }

  /// Logic to handle back behavior
  back() {
    handlePop() ? Get.back() : displayConfirmDialog();
  }

  bool handlePop() {
    bool isPortfolioTitleEmpty = _portfolioTitleController.text.isEmpty;
    bool isPortfolioDescriptionEmpty =
        _portfolioDescriptionController.text.isEmpty;
    bool isPortfolioImageEmpty = _portfolioImage.value.path.isEmpty;
    bool isAllFieldEmpty = isPortfolioTitleEmpty &&
        isPortfolioDescriptionEmpty &&
        isPortfolioImageEmpty;
    return isAllFieldEmpty ? true : false;
  }

  displayConfirmDialog() {
    Get.dialog(
      AppConfirmationDialog(
        confirmationMessage: 'Discard Portfolio?',
        confirmButtonText: 'Discard',
        cancelButtonText: 'Cancel',
        onConfirm: () {
          Get.back(closeOverlays: true);
        },
        onCancel: () {
          Get.back();
        },
      ),
    );
  }
}

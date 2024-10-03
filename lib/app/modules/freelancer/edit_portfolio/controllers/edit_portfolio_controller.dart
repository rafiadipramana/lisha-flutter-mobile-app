import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lisha/app/domain/entities/portfolio.dart';
import 'package:lisha/app/domain/use_cases/get_freelancer_portfolio_by_id_use_case.dart';
import 'package:lisha/app/domain/use_cases/update_freelancer_portfolio_use_case.dart';
import 'package:lisha/app/domain/use_cases/upload_portfolio_image_use_case.dart';

import '../../../../data/services/supabase_service.dart';
import '../../../../domain/entities/portfolio_category.dart';
import '../../../../domain/use_cases/get_portfolio_categories_use_case.dart';
import '../../../../widgets/app_confirmation_dialog.dart';

class EditPortfolioController extends GetxController {
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

  late final RxString _networkPortfolioImageUrl;
  String get networkPortfolioImageUrl => _networkPortfolioImageUrl.value;

  final RxInt _selectedPortfolioId = 0.obs;
  int get selectedPortfolioId => _selectedPortfolioId.value;

  final RxBool _isPortfolioImageChanged = false.obs;
  bool get isPortfolioImageChanged => _isPortfolioImageChanged.value;

  @override
  void onInit() {
    print((Get.arguments as Portfolio).id);
    _selectedPortfolioId.value = (Get.arguments as Portfolio).id!;
    _portfolioCategories = <PortfolioCategory>[].obs;
    _selectedPortfolioCategory = Rxn<PortfolioCategory>();
    _portfolioTitleController = TextEditingController();
    _portfolioDescriptionController = TextEditingController();
    _portfolioImage = File('').obs;
    _networkPortfolioImageUrl = ''.obs;
    super.onInit();
  }

  @override
  void onReady() async {
    final getPortfolioCategoriesUseCase =
        Get.find<GetPortfolioCategoriesUseCase>();
    _portfolioCategories.assignAll(
      await getPortfolioCategoriesUseCase.execute(),
    );
    final portfolio = await getPortfolioById();
    _portfolioTitleController.text = portfolio.title;
    _portfolioDescriptionController.text = portfolio.description ?? '';
    _networkPortfolioImageUrl.value = portfolio.imageUrl ?? '';
    _selectedPortfolioCategory.value = _portfolioCategories.firstWhere(
      (category) => category == portfolio.category,
    );
    _networkPortfolioImageUrl.value = portfolio.imageUrl ?? '';
    super.onReady();
  }

  @override
  void onClose() {
    _portfolioTitleController.dispose();
    _portfolioDescriptionController.dispose();
    super.onClose();
  }

  Future<Portfolio> getPortfolioById() async {
    try {
      final getPortfolioByIdUseCase = Get.find<GetFreelancerPortfolioByIdUseCase>();
      return await getPortfolioByIdUseCase.execute(
        portfolioId: selectedPortfolioId,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to get portfolio',
        snackPosition: SnackPosition.BOTTOM,
      );
      rethrow;
    }
  }

  Future<void> updatePortfolio() async {
    final updatePortfolioUseCase = Get.find<UpdateFreelancerPortfolioUseCase>();
    final uploadPortfolioImageUseCase = Get.find<UploadPortfolioImageUseCase>();
    try {
      String freelancerPortfolioImageDownloadUrl = networkPortfolioImageUrl;
      if (isPortfolioImageChanged) {
        freelancerPortfolioImageDownloadUrl = await uploadPortfolioImageUseCase.execute(
          userId: SupabaseService.userId!,
          imageFile: portfolioImage,
        );
      }
      await updatePortfolioUseCase.execute(
        portfolio: Portfolio(
          id: selectedPortfolioId,
          title: portfolioTitleController.text,
          description: portfolioDescriptionController.text,
          imageUrl: freelancerPortfolioImageDownloadUrl,
          category: selectedPortfolioCategory!,
        ),
      );
      Get.back(result: true);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update portfolio',
        snackPosition: SnackPosition.BOTTOM,
      );
      rethrow;
    }
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _isPortfolioImageChanged.value = true;
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

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../domain/entities/marketing_service.dart';
import '../../../../../domain/use_cases/update_freelancer_marketing_service_use_case.dart';
import '../../../../../widgets/app_confirmation_dialog.dart';
import '../../../../../data/services/supabase_service.dart';
import '../../../../../domain/use_cases/get_freelancer_marketing_service_by_id_use_case.dart';
import '../../../../../domain/use_cases/upload_freelancer_marketing_service_image_use_case.dart';

class EditFreelancerServiceController extends GetxController {
  late final TextEditingController _serviceTitleController;
  TextEditingController get serviceTitleController => _serviceTitleController;

  late final TextEditingController _serviceDescriptionController;
  TextEditingController get serviceDescriptionController =>
      _serviceDescriptionController;

  late final TextEditingController _servicePriceController;
  TextEditingController get servicePriceController => _servicePriceController;

  late final Rx<File> _serviceImage;
  File get serviceImage => _serviceImage.value;

  late final RxString _networkServiceImageUrl;
  String get networkServiceImageUrl => _networkServiceImageUrl.value;

  final RxInt _selectedMarketingServiceId = 0.obs;
  int get selectedMarketingServiceId => _selectedMarketingServiceId.value;

  final RxBool _isServiceImageChanged = false.obs;
  bool get isServiceImageChanged => _isServiceImageChanged.value;

  @override
  void onInit() {
    _selectedMarketingServiceId.value = (Get.arguments as MarketingService).id!;
    _serviceTitleController = TextEditingController();
    _serviceDescriptionController = TextEditingController();
    _servicePriceController = TextEditingController();
    _serviceImage = File('').obs;
    _networkServiceImageUrl = ''.obs;
    super.onInit();
  }

  @override
  void onReady() async {
    final marketingService = await getMarketingServiceById();
    _serviceTitleController.text = marketingService.title;
    _serviceDescriptionController.text = marketingService.description ?? '';
    _servicePriceController.text = marketingService.price.toString();
    _networkServiceImageUrl.value = marketingService.imageUrl ?? '';
    super.onReady();
  }

  @override
  void onClose() {
    _serviceTitleController.dispose();
    _serviceDescriptionController.dispose();
    _servicePriceController.dispose();
    super.onClose();
  }

  Future<MarketingService> getMarketingServiceById() async {
    try {
      final getFreelancerMarketingServiceByIdUseCase =
          Get.find<GetFreelancerMarketingServiceByIdUseCase>();
      return await getFreelancerMarketingServiceByIdUseCase.execute(
        marketingServiceId: selectedMarketingServiceId,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to get freelancer marketing service',
        snackPosition: SnackPosition.BOTTOM,
      );
      rethrow;
    }
  }

  Future<void> updateMarketingService() async {
    final updateFreelancerMarketingServiceCase =
        Get.find<UpdateFreelancerMarketingServiceUseCase>();
    final uploadFreelancerMarketingServiceImageUseCase =
        Get.find<UploadFreelancerMarketingServiceImageUseCase>();
    try {
      String freelancerMarketingImageDownloadUrl = '';
      if (_isServiceImageChanged.value) {
        freelancerMarketingImageDownloadUrl =
            await uploadFreelancerMarketingServiceImageUseCase.execute(
          userId: SupabaseService.userId!,
          imageFile: _serviceImage.value,
        );
      }
      await updateFreelancerMarketingServiceCase.execute(
        MarketingService(
          id: selectedMarketingServiceId,
          title: serviceTitleController.text,
          description: serviceDescriptionController.text,
          price: double.parse(servicePriceController.text),
          imageUrl: freelancerMarketingImageDownloadUrl.isEmpty
              ? null
              : freelancerMarketingImageDownloadUrl,
        ),
      );
      Get.back(result: true);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update freelancer marketing service',
        snackPosition: SnackPosition.BOTTOM,
      );
      rethrow;
    }
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _isServiceImageChanged.value = true;
      _serviceImage.value = File(pickedFile.path);
    }
  }

  /// Logic to handle back behavior
  back() {
    handlePop() ? Get.back() : displayConfirmDialog();
  }

  bool handlePop() {
    bool isServiceTitleEmpty = _serviceTitleController.text.isEmpty;
    bool isServiceDescriptionEmpty = _serviceDescriptionController.text.isEmpty;
    bool isServicePriceEmpty = _servicePriceController.text.isEmpty;
    bool isServiceImageEmpty = _serviceImage.value.path.isEmpty;
    bool isAllFieldEmpty = isServiceTitleEmpty &&
        isServiceDescriptionEmpty &&
        isServicePriceEmpty &&
        isServiceImageEmpty;
    return isAllFieldEmpty ? true : false;
  }

  displayConfirmDialog() {
    Get.dialog(
      AppConfirmationDialog(
        confirmationMessage:
            'Are you sure you want to discard this marketing service?',
        confirmButtonText: 'Discard',
        cancelButtonText: 'Cancel',
        onConfirm: () {
          Get.back(
            closeOverlays: true,
          );
        },
        onCancel: () => Get.back(),
      ),
    );
  }
}

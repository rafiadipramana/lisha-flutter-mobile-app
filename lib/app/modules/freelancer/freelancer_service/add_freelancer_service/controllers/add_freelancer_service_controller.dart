import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lisha/app/widgets/app_confirmation_dialog.dart';
import '../../../../../domain/entities/marketing_service.dart';
import '../../../../../domain/use_cases/add_freelancer_marketing_service_use_case.dart';
import '../../../../../domain/use_cases/upload_freelancer_marketing_service_image_use_case.dart';
import '../../../../../data/services/supabase_service.dart';

class AddFreelancerServiceController extends GetxController {
  late final TextEditingController _serviceTitleController;

  TextEditingController get serviceTitleController => _serviceTitleController;

  late final TextEditingController _serviceDescriptionController;

  TextEditingController get serviceDescriptionController =>
      _serviceDescriptionController;

  late final TextEditingController _servicePriceController;

  TextEditingController get servicePriceController => _servicePriceController;

  late final Rx<File> _serviceImage;

  File get serviceImage => _serviceImage.value;

  @override
  void onInit() {
    _serviceTitleController = TextEditingController();
    _serviceDescriptionController = TextEditingController();
    _servicePriceController = TextEditingController();
    _serviceImage = File('').obs;
    super.onInit();
  }

  @override
  void onClose() {
    _serviceTitleController.dispose();
    _serviceDescriptionController.dispose();
    _servicePriceController.dispose();
    super.onClose();
  }

  Future<void> addMarketingService() async {
    final addFreelancerMarketingServiceCase =
        Get.find<AddFreelancerMarketingServiceUseCase>();
    final uploadFreelancerMarketingServiceImageUseCase =
        Get.find<UploadFreelancerMarketingServiceImageUseCase>();
    try {
      String freelancerMarketingImageDownloadUrl = '';
      if (_serviceImage.value.path.isNotEmpty) {
        freelancerMarketingImageDownloadUrl =
            await uploadFreelancerMarketingServiceImageUseCase.execute(
          userId: SupabaseService.userId!,
          imageFile: _serviceImage.value,
        );
      }
      await addFreelancerMarketingServiceCase.execute(
        MarketingService(
          title: serviceTitleController.text,
          description: serviceDescriptionController.text,
          price: double.parse(servicePriceController.text),
          imageUrl: freelancerMarketingImageDownloadUrl.isEmpty ? null : freelancerMarketingImageDownloadUrl,
        ),
      );
      Get.back(result: true);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add freelancer marketing service',
        snackPosition: SnackPosition.BOTTOM,
      );
      rethrow;
    }
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
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

  /// Display confirmation dialog when user tries to discard marketing service
  void displayConfirmDialog() {
    Get.dialog(
      AppConfirmationDialog(
        confirmationMessage: 'Discard Marketing Service?',
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

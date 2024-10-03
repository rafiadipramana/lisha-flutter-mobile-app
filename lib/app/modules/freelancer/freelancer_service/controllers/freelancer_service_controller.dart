import 'package:get/get.dart';
import 'package:lisha/app/domain/use_cases/delete_freelancer_marketing_service_image_use_case.dart';
import 'package:lisha/app/domain/use_cases/delete_freelancer_marketing_service_use_case.dart';
import 'package:lisha/app/widgets/app_confirmation_dialog.dart';
import '../../../../data/services/supabase_service.dart';
import '../../../../domain/entities/marketing_service.dart';
import '../../../../domain/use_cases/get_freelancer_marketing_services_use_case.dart';
import '../../../../routes/app_pages.dart';

class FreelancerServiceController extends GetxController {
  final RxList<MarketingService> _marketingServices = <MarketingService>[].obs;

  List<MarketingService> get marketingServices => _marketingServices;

  @override
  void onReady() async {
    await getMarketingServices();
    super.onReady();
  }

  Future<void> getMarketingServices() async {
    _marketingServices.assignAll(
      await Get.find<GetFreelancerMarketingServicesUseCase>().execute(),
    );
  }

  Future<void> navigateToAddFreelancerService() async {
    final result = await Get.toNamed(
      Routes.ADD_FREELANCER_SERVICE,
    );
    if (result != null) {
      await getMarketingServices();
    }
  }

  Future<void> navigateToEditFreelancerService({
    required MarketingService marketingService,
  }) async {
    final result = await Get.toNamed(
      Routes.EDIT_FREELANCER_SERVICE,
      arguments: marketingService,
    );
    if (result != null) {
      await getMarketingServices();
    }
  }

  /// Display a confirmation dialog before deleting the marketing service
  void displayDeleteConfirmationDialog({
    required MarketingService marketingService,
  }) {
    Get.dialog(
      AppConfirmationDialog(
        confirmationMessage: 'Are you sure you want to delete this service?',
        confirmButtonText: 'Delete',
        cancelButtonText: 'Cancel',
        onConfirm: () async {
          await deleteMarketingService(marketingService: marketingService);
          Get.back();
        },
        onCancel: () {
          Get.back();
        },
      ),
    );
  }

  Future<void> deleteMarketingService({
    required MarketingService marketingService,
  }) async {
    final deleteFreelancerMarketingServiceCase =
        Get.find<DeleteFreelancerMarketingServiceUseCase>();
    final deleteFreelancerMarketingServiceImageUseCase =
        Get.find<DeleteFreelancerMarketingServiceImageUseCase>();
    try {
      if (marketingService.imageUrl != null) {
        await deleteFreelancerMarketingServiceImageUseCase.execute(
          userId: SupabaseService.userId!,
          imageUrl: marketingService.imageUrl!,
        );
      }

      await deleteFreelancerMarketingServiceCase.execute(marketingService);
      await getMarketingServices();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to delete freelancer marketing service',
        snackPosition: SnackPosition.BOTTOM,
      );
      rethrow;
    }
  }
}

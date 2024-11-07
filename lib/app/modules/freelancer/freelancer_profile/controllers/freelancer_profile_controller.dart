import 'package:get/get.dart';
import 'package:lisha/app/domain/use_cases/logout_use_case.dart';
import 'package:lisha/app/routes/app_pages.dart';
import 'package:lisha/app/widgets/app_confirmation_dialog.dart';

class FreelancerProfileController extends GetxController {

  void displayConfirmationDialog() {
    Get.dialog(
      AppConfirmationDialog(
        confirmationMessage: 'Are you sure you want to logout?',
        confirmButtonText: 'Logout',
        cancelButtonText: 'Cancel',
        onConfirm: () => logout(),
        onCancel: () => Get.back(),
      ),
    );
  }

  void navigateToChangePaymentMethod() {
    Get.toNamed(Routes.FREELANCER_PAYMENT_METHOD);
  }

  Future<void> logout() async {
    await Get.find<LogoutUseCase>().execute();
    Get.offAndToNamed(Routes.LOGIN);
  }
}

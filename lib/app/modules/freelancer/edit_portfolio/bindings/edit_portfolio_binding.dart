import 'package:get/get.dart';

import '../controllers/edit_portfolio_controller.dart';

class EditPortfolioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPortfolioController>(
      () => EditPortfolioController(),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lisha/app/modules/root/widgets/app_bottom_navbar.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.changePage,
        children: controller.pages,
      ),
      bottomNavigationBar: Obx(
        () => AppBottomNavbar(
          currentIndex: controller.currentIndex,
          onTap: controller.changePage,
        ),
      ),
    );
  }
}

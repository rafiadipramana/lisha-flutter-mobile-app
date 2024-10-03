import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController {
  late final CarouselSliderController _serviceCarouselSliderController;
  CarouselSliderController get serviceCarouselSliderController =>
      _serviceCarouselSliderController;

  @override
  void onInit() {
    _serviceCarouselSliderController = CarouselSliderController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

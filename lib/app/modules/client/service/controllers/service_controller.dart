import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController {
  late final CarouselSliderController _serviceCarouselSliderController;
  CarouselSliderController get serviceCarouselSliderController =>
      _serviceCarouselSliderController;

  late final CarouselOptions _carouselOptions;
  CarouselOptions get carouselOptions => _carouselOptions;

  late final PageController _pageController;
  PageController get pageController => _pageController;

  @override
  void onInit() {
    _serviceCarouselSliderController = CarouselSliderController();
    _carouselOptions = CarouselOptions(
      height: double.infinity,
      enableInfiniteScroll: false,
      enlargeCenterPage: true,
      viewportFraction: 0.75,
      onPageChanged: (index, reason) {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      },
    );
    _pageController = PageController();
    super.onInit();
  }
}

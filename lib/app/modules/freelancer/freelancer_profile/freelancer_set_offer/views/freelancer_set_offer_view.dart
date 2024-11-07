import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/freelancer_set_offer_controller.dart';

class FreelancerSetOfferView extends GetView<FreelancerSetOfferController> {
  const FreelancerSetOfferView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FreelancerSetOfferView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FreelancerSetOfferView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

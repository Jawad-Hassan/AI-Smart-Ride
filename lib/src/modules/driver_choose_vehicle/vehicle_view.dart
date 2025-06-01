import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/driver_choose_vehicle/vehicle_logic.dart';
import 'package:get/get.dart';

import 'package:flutter_application_1/src/modules/customwidget/custom_button.dart';

class VehicleSelectionView extends StatelessWidget {
  final logic = Get.put(VehicleSelectionLogic());

  VehicleSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top background image
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
            width: double.infinity,
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 30),

          // Car Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: CustomButton(
              text: 'Choose Car',
              onPressed: logic.onCarSelected,
            ),
          ),

          // Rickshaw Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: CustomButton(
              text: 'Choose Rickshaw',
              onPressed: logic.onRickshawSelected,
            ),
          ),

          // Bike Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: CustomButton(
              text: 'Choose Bike',
              onPressed: logic.onBikeSelected,
            ),
          ),
        ],
      ),
    );
  }
}

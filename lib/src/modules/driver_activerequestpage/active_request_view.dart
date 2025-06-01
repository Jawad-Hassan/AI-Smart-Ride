import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/customwidget/custom_button.dart';
import 'package:flutter_application_1/src/modules/customwidget/textfields.dart';
import 'package:flutter_application_1/src/modules/driver_activerequestpage/active_request_logic.dart';

import 'package:get/get.dart';

class DriverActiveRequestView extends StatelessWidget {
  final logic = Get.put(DriverActiveRequestLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Image with overlaid "Ride Requests" text
          Stack(
            children: [
              Image.asset(
                'assets/images/top.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 16,
                bottom: 16,
                child: Text(
                  'Ride Requests',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black26,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Ride Request Info and Input
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    CustomButton(
      onPressed: () {
        // Optional: show ride details, map, etc.
      },
      height: 60,
      backgroundColor: Colors.blue.shade100,
      textColor: Colors.blue.shade900,
      borderRadius: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Gulberg to Township',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Rs. 500',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    ),
  ],
),

                ),

                const SizedBox(height: 24),
                const Text(
                  'Offer your price',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),

                Textfield(
                  hintKey: 'Rs.',
                  controller: logic.priceController,
                  inputType: TextInputType.number,
                ),

                const SizedBox(height: 20),
                CustomButton(
                  text: 'Next Step',
                  onPressed: logic.onNextStepPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/modules/customwidget/custom_button.dart';
import 'package:flutter_application_1/src/modules/customwidget/textfields.dart';
import 'active_request_logic.dart';

class DriverActiveRequestView extends StatelessWidget {
  const DriverActiveRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<DriverActiveRequestLogic>();

    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          final ride = logic.activeRide.value;
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/top.png',
                        width: double.infinity, height: 200, fit: BoxFit.cover),
                    Positioned(
                      top: 16,
                      // left: 10,
                      child: GestureDetector(
                        child: Container(

                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () => Get.back(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 50,
                      bottom: 135,
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
                                offset: Offset(1, 1))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (ride != null)
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 6,
                                  offset: Offset(0, 3)),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomButton(
                                onPressed: () {},
                                height: 60,
                                backgroundColor: Colors.blue.shade100,
                                textColor: Colors.blue.shade900,
                                borderRadius: 10,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('${ride.route}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(height: 4),
                                    Text('Rs. ${ride.fare}',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blue)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      SizedBox(height: 24),
                      Text('Offer your price',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                      SizedBox(height: 10),
                      Textfield(
                          hintKey: 'Rs.',
                          controller: logic.priceController,
                          inputType: TextInputType.number),
                      SizedBox(height: 20),
                      CustomButton(
                          text: 'Next Step',
                          onPressed: logic.onNextStepPressed),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

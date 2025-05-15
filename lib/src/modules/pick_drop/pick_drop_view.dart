import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/modules/customwidget/custom_button.dart';
import 'package:flutter_application_1/src/modules/utlis/app_images.dart';
import 'pick_drop_logic.dart';

class PickDropView extends StatelessWidget {
  const PickDropView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PickDropController>(
      init: PickDropController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                  bottom: 24), // Extra padding for keyboard
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Image with Text Overlay
                  SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          AppImages.pick_drop,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: const Icon(Icons.arrow_back,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Enter Pickup and Dropoff",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Input Fields Container
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          TextField(
                            controller: controller.pickupController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.location_on_outlined,
                                  color: Colors.red),
                              hintText: 'Search Pickup Location',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            controller: controller.dropoffController,
                            decoration: const InputDecoration(
                              prefixIcon:
                                  Icon(Icons.location_on, color: Colors.blue),
                              hintText: 'Search Dropoff Location',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            controller: controller.fareController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Fare',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Auto-accept for written fare?"),
                              Switch(
                                value: controller.autoAccept,
                                onChanged: controller.toggleAutoAccept,
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          CustomButton(
                            text: "Search",
                            onPressed: controller.handleSearch,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            borderRadius: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

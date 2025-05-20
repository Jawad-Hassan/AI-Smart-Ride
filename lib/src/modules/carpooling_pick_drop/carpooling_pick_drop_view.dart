import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/carpooling_pick_drop/carpooling_pick_drop_logic.dart';
import 'package:flutter_application_1/src/modules/customwidget/textfields.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/modules/customwidget/custom_button.dart';

import 'package:flutter_application_1/src/modules/utlis/app_images.dart';


class CarpoolingPickDropView extends StatelessWidget {
  const CarpoolingPickDropView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PickDropcontroller>(
      init: PickDropcontroller(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: controller.formKey,
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
                            Textfield(
                              hintKey: "Search Pickup Location",
                              icon: Icons.location_on_outlined,
                              controller: controller.pickupController,
                              validator: (value) =>
                                  value!.isEmpty ? 'Required' : null,
                            ),
                            const SizedBox(height: 5),
                            Textfield(
                              hintKey: "Search Dropoff Location",
                              icon: Icons.location_on,
                              controller: controller.dropoffController,
                              validator: (value) =>
                                  value!.isEmpty ? 'Required' : null,
                            ),
                            const SizedBox(height: 5),
                            Textfield(
                              hintKey: "Fare",
                              controller: controller.fareController,
                              inputType: TextInputType.number,
                              validator: (value) =>
                                  value!.isEmpty ? 'Required' : null,
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
                            const SizedBox(height: 5),
                            Textfield(
                              hintKey: "Number of passengers",
                              controller: controller.passengerController,
                              inputType: TextInputType.number,
                              validator: (value) =>
                                  value!.isEmpty ? 'Required' : null,
                            ),
                            const SizedBox(height: 5),
                            GestureDetector(
                              onTap: () => controller.pickDate(context),
                              child: AbsorbPointer(
                                child: Textfield(
                                  hintKey: "Select Date",
                                  controller: controller.dateController,
                                  icon: Icons.calendar_today,
                                  validator: (value) =>
                                      value!.isEmpty ? 'Required' : null,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            GestureDetector(
                              onTap: () => controller.pickTime(context),
                              child: AbsorbPointer(
                                child: Textfield(
                                  hintKey: "Select Time",
                                  controller: controller.timeController,
                                  icon: Icons.access_time,
                                  validator: (value) =>
                                      value!.isEmpty ? 'Required' : null,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
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

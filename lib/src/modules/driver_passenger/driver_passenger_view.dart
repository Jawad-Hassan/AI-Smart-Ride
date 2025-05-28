import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/modules/driver_passenger/driver_passenger_logic.dart';
import 'package:flutter_application_1/src/modules/customwidget/custom_button.dart';
import 'package:flutter_application_1/src/modules/utlis/app_images.dart';
import 'package:flutter_application_1/src/modules/utlis/app_colors.dart';

class UserTypeSelectionView extends StatelessWidget {
  const UserTypeSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserTypeSelectionController>(
      init: UserTypeSelectionController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                // Top background image with back arrow
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 800 / 230,
                      child: Image.asset(
                        AppImages.bg,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      top: 16,
                      left: 16,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Centered buttons
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: CustomButton(
                          text: 'Continue as Driver',
                          backgroundColor: AppColorss.primary,
                          textColor: Colors.white,
                          onPressed: controller.onDriverPressed,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: CustomButton(
                          text: 'Continue as Passenger',
                          backgroundColor: AppColorss.primary,
                          textColor: Colors.white,
                          onPressed: controller.onPassengerPressed,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

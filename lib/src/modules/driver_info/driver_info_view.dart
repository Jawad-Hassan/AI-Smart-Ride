import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/driver_doc_upload/driver_doc_view.dart';
import 'package:get/get.dart';
import 'driver_info_logic.dart';
import 'package:flutter_application_1/src/modules/customwidget/custom_button.dart';
import 'package:flutter_application_1/src/modules/customwidget/textfields.dart';

// Dummy next page for navigation – replace with your own screen
class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Next Page')),
      body: Center(child: Text('You have successfully navigated!')),
    );
  }
}

class DriverInfoView extends StatelessWidget {
  final logic = Get.put(DriverInfoLogic());

  DriverInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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

            const SizedBox(height: 20),

            // Selfie upload section
            Obx(() {
              return GestureDetector(
                onTap: () {
                  if (logic.selectedImage.value != null) {
                    _showDeleteDialog(context);
                  } else {
                    logic.takeSelfie();
                  }
                },
                child: logic.selectedImage.value == null
                    ? CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.grey.shade300,
                        child: const Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: Colors.black54,
                        ),
                      )
                    : CircleAvatar(
                        radius: 55,
                        backgroundImage: FileImage(logic.selectedImage.value!),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.blue,
                            child: const Icon(Icons.close, color: Colors.white, size: 18),
                          ),
                        ),
                      ),
              );
            }),

            const SizedBox(height: 25),

            // Name TextField using your custom widget
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Textfield(
                hintKey: 'Driver Name',
                controller: logic.nameController,
                inputType: TextInputType.name,
              ),
            ),

            const SizedBox(height: 20),

            // Error message
            Obx(() => logic.errorText.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      logic.errorText.value,
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                : const SizedBox()),

            const SizedBox(height: 20),

            // Next Button using CustomButton
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomButton(
                text: "Next",
                onPressed: () {
                  if (logic.nameController.text.isEmpty ||
                      logic.selectedImage.value == null) {
                    logic.errorText.value = "Please enter name and upload selfie";
                  } else {
                    logic.errorText.value = "";
                    Get.to(() => DocVerificationView()); // 👈 Replace with your actual screen
                  }
                },
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    Get.defaultDialog(
      title: 'Remove Selfie?',
      middleText: 'Do you want to delete the selfie?',
      textCancel: 'Cancel',
      textConfirm: 'Delete',
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
        logic.deleteSelfie();
      },
    );
  }
}

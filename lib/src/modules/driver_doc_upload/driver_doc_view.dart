import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/customwidget/custom_button.dart';
import 'package:flutter_application_1/src/modules/driver_choose_vehicle/vehicle_view.dart';
import 'package:flutter_application_1/src/modules/driver_doc_upload/image_preview.dart';

import 'package:get/get.dart';

import 'driver_doc_logic.dart'; // Adjust path if needed
import '../utlis/app_colors.dart';
import '../utlis/app_fonts.dart';

class DocVerificationView extends StatelessWidget {
  const DocVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(DocVerificationLogic());

    Widget buildImageUploadField({
      required String label,
      required Rx<File?> image,
      required RxString errorText,
      required VoidCallback onTap,
      required VoidCallback onDelete,
    }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: StyleRefer.poppinsSemiBold.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              if (image.value == null) {
                onTap();
              } else {
                // View full image
                Get.to(() => ImagePreviewView(imageFile: image.value!));
              }
            },
            onLongPress: () {
              if (image.value != null) {
                // Show delete confirmation dialog
                Get.defaultDialog(
                  title: "Remove Image",
                  middleText: "Do you want to remove this image?",
                  textCancel: "Cancel",
                  textConfirm: "Delete",
                  confirmTextColor: Colors.white,
                  onConfirm: () {
                    onDelete();
                    Get.back();
                  },
                );
              }
            },
            child: Obx(() {
              return Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColorss.inputBorder),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: image.value != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          image.value!,
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                        ),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.file_upload,
                                size: 40, color: Colors.grey),
                            SizedBox(height: 8),
                            Text(
                              "Tap to upload image",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
              );
            }),
          ),
          Obx(() {
            return errorText.value.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      errorText.value,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 13,
                      ),
                    ),
                  )
                : const SizedBox.shrink();
          }),
          const SizedBox(height: 20),
        ],
      );
    }

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

          // White container
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verification',
                      style: StyleRefer.poppinsSemiBold.copyWith(fontSize: 22),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Submit your documents',
                      style: StyleRefer.poppinsRegular.copyWith(
                        fontSize: 14,
                        color: AppColorss.text.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Front License Image Upload Field
                    buildImageUploadField(
                      label: 'Upload Front License Image',
                      image: logic.selectedFrontImage,
                      errorText: logic.frontErrorText,
                      onTap: () =>
                          logic.showImageSourceSelection(isFront: true),
                      onDelete: () {
                        logic.selectedFrontImage.value = null;
                        logic.uploadFrontController.clear();
                      },
                    ),

                    // Back License Image Upload Field
                    buildImageUploadField(
                      label: 'Upload Back License Image',
                      image: logic.selectedBackImage,
                      errorText: logic.backErrorText,
                      onTap: () =>
                          logic.showImageSourceSelection(isFront: false),
                      onDelete: () {
                        logic.selectedBackImage.value = null;
                        logic.uploadBackController.clear();
                      },
                    ),

                    const SizedBox(height: 10),

                    // Next Step Button
                    CustomButton(
                      text: 'Next Step',
                      onPressed: () {
                        if (logic.selectedFrontImage.value == null) {
                          logic.frontErrorText.value =
                              'Please upload front license image.';
                        } else {
                          logic.frontErrorText.value = '';
                        }

                        if (logic.selectedBackImage.value == null) {
                          logic.backErrorText.value =
                              'Please upload back license image.';
                        } else {
                          logic.backErrorText.value = '';
                        }

                        if (logic.selectedFrontImage.value != null &&
                            logic.selectedBackImage.value != null) {
                          Get.to(() => VehicleSelectionView());
                        }
                      },
                      backgroundColor: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;
import 'package:device_info_plus/device_info_plus.dart';

class DocVerificationLogic extends GetxController {
  final uploadFrontController = TextEditingController();
  final uploadBackController = TextEditingController();

  final Rx<File?> selectedFrontImage = Rx<File?>(null);
  final Rx<File?> selectedBackImage = Rx<File?>(null);

  final RxString frontErrorText = ''.obs;
  final RxString backErrorText = ''.obs;

  Future<void> pickImageFromCamera({required bool isFront}) async {
    if (isFront) frontErrorText.value = '';
    else backErrorText.value = '';

    final status = await Permission.camera.request();

    if (!status.isGranted) {
      if (isFront) frontErrorText.value = 'Camera permission is required to take a photo.';
      else backErrorText.value = 'Camera permission is required to take a photo.';
      return;
    }

    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      if (isFront) {
        selectedFrontImage.value = File(pickedFile.path);
        uploadFrontController.text = pickedFile.name;
      } else {
        selectedBackImage.value = File(pickedFile.path);
        uploadBackController.text = pickedFile.name;
      }
    } else {
      if (isFront) frontErrorText.value = 'No photo taken.';
      else backErrorText.value = 'No photo taken.';
    }
  }

  Future<void> pickImageFromGallery({required bool isFront}) async {
    if (isFront) frontErrorText.value = '';
    else backErrorText.value = '';

    if (defaultTargetPlatform == TargetPlatform.android) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      final sdkInt = androidInfo.version.sdkInt;

      if (sdkInt >= 33) {
        final status = await Permission.photos.request();
        if (!status.isGranted) {
          if (isFront) frontErrorText.value = 'Gallery permission is required to select an image.';
          else backErrorText.value = 'Gallery permission is required to select an image.';
          return;
        }
      } else {
        final status = await Permission.storage.request();
        if (!status.isGranted) {
          if (isFront) frontErrorText.value = 'Storage permission is required to select an image.';
          else backErrorText.value = 'Storage permission is required to select an image.';
          return;
        }
      }
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      final status = await Permission.photos.request();
      if (!status.isGranted) {
        if (isFront) frontErrorText.value = 'Gallery permission is required to select an image.';
        else backErrorText.value = 'Gallery permission is required to select an image.';
        return;
      }
    }

    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (isFront) {
        selectedFrontImage.value = File(pickedFile.path);
        uploadFrontController.text = pickedFile.name;
      } else {
        selectedBackImage.value = File(pickedFile.path);
        uploadBackController.text = pickedFile.name;
      }
    } else {
      if (isFront) frontErrorText.value = 'No image selected.';
      else backErrorText.value = 'No image selected.';
    }
  }

  void showImageSourceSelection({required bool isFront}) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take a Photo'),
              onTap: () {
                Get.back();
                pickImageFromCamera(isFront: isFront);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Choose from Gallery'),
              onTap: () {
                Get.back();
                pickImageFromGallery(isFront: isFront);
              },
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text('Cancel'),
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onClose() {
    uploadFrontController.dispose();
    uploadBackController.dispose();
    super.onClose();
  }
}

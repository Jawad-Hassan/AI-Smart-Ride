import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/modules/Home_Page/homepage_view.dart';
// Adjust path if needed

class RideSummaryCarpoolingController extends GetxController {
  var rating = 0.obs;
  final commentController = TextEditingController();

  void setRating(int newRating) {
    rating.value = newRating;
  }

  void submitRating() {
    final int finalRating = rating.value;
    final String comment = commentController.text.trim();

    // Log feedback (simulate backend submission)
    print('🚗 Ride Feedback Submitted:');
    print('⭐ Rating: $finalRating');
    print('📝 Comment: $comment');

    Get.snackbar(
      "Thank you!",
      "Your feedback has been submitted.",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );

    // Navigate back to homepage
    Get.offAll(() => const HomePageView());
  }

  @override
  void onClose() {
    commentController.dispose();
    super.onClose();
  }
}

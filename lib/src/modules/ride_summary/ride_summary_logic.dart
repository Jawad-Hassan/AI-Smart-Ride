import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RideSummaryController extends GetxController {
  var rating = 0.obs;
  var commentController = TextEditingController();

  void setRating(int newRating) {
    rating.value = newRating;
  }

  void submitRating() {
    String comment = commentController.text;
    int finalRating = rating.value;

    // Simulate backend call
    print("Rating Submitted: $finalRating");
    print("Comment: $comment");

    Get.snackbar("Thank you!", "Your feedback has been submitted.");
    Get.offAllNamed('/home'); // Redirect to home or another appropriate page
  }
}

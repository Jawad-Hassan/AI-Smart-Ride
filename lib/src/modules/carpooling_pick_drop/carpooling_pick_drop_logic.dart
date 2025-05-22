import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/choose_ride_carpooling/choose_ride_carpooling_view.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class PickDropcontroller extends GetxController {
  final TextEditingController pickupController = TextEditingController();
  final TextEditingController dropoffController = TextEditingController();
  final TextEditingController fareController = TextEditingController();
  final TextEditingController passengerController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LatLng? pickupLatLng;
  LatLng? dropoffLatLng;

  bool autoAccept = false;

  void toggleAutoAccept(bool value) {
    autoAccept = value;
    update();
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      dateController.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      timeController.text = picked.format(context);
    }
  }

void handleSearch() {
  if (formKey.currentState!.validate()) {
    final pickupAddress = pickupController.text;
    final dropoffAddress = dropoffController.text;
    final fare = fareController.text;
    final passengers = passengerController.text;
    final date = dateController.text;
    final time = timeController.text;

    pickupLatLng ??= const LatLng(33.6844, 73.0479); // Example fallback
    dropoffLatLng ??= const LatLng(24.8607, 67.0011); // Example fallback

    if (pickupLatLng == null || dropoffLatLng == null) {
      print("Missing pickup/dropoff coordinates");
      return;
    }

    Get.to(() => ChooseRideCarpoolingView(
          pickupLocation: pickupLatLng!,
          dropoffLocation: dropoffLatLng!,
          pickupAddress: pickupAddress,
          dropoffAddress: dropoffAddress,
          fare: "Rs. $fare", // ✅ Pass the fare here
        ));
  } else {
    print("Form not valid");
  }
}


  @override
  void onClose() {
    pickupController.dispose();
    dropoffController.dispose();
    fareController.dispose();
    passengerController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.onClose();
  }
}

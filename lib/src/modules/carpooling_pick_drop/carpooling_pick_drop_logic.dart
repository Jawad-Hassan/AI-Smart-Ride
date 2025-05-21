import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/choose_ride/choose_ride_view.dart';
import 'package:get/get.dart';

class PickDropcontroller extends GetxController {
  final TextEditingController pickupController = TextEditingController();
  final TextEditingController dropoffController = TextEditingController();
  final TextEditingController fareController = TextEditingController();
  final TextEditingController passengerController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      timeController.text = picked.format(context);
    }
  }

  void handleSearch() {
  if (formKey.currentState!.validate()) {
    final pickup = pickupController.text;
    final dropoff = dropoffController.text;
    final fare = fareController.text;
    final passengers = passengerController.text;
    final date = dateController.text;
    final time = timeController.text;

    print("Pickup: $pickup");
    print("Dropoff: $dropoff");
    print("Fare: $fare");
    print("Passengers: $passengers");
    print("Date: $date");
    print("Time: $time");
    print("AutoAccept: $autoAccept");

    Get.to(() =>ChooseRideView()); // <-- Navigate here
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

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/order_info/order_info_logic.dart';
import 'package:flutter_application_1/src/modules/utlis/app_colors.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';

class DriverTrackingView extends StatelessWidget {
  final Map<String, dynamic> driverInfo;
  final LatLng pickupLocation;
  final LatLng dropoffLocation;
  final String pickupAddress;
  final String dropoffAddress;

  late final DriverTrackingController controller;

  DriverTrackingView({
    Key? key,
    required this.driverInfo,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.pickupAddress,
    required this.dropoffAddress,
  }) : super(key: key) {
    // This ensures the controller is initialized correctly
    controller = Get.put(DriverTrackingController());

    controller.pickupLocation = pickupLocation;
    controller.dropoffLocation = dropoffLocation;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Stack(
          children: [
            FlutterMap(
              options:
                  MapOptions(center: controller.driverLocation.value, zoom: 13),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: controller.driverLocation.value,
                      width: 60,
                      height: 60,
                      child: const Icon(Icons.local_taxi,
                          color: Colors.orange, size: 40),
                    ),
                    Marker(
                      point: pickupLocation,
                      width: 60,
                      height: 60,
                      child: const Icon(Icons.location_pin,
                          color: Colors.green, size: 40),
                    ),
                    Marker(
                      point: dropoffLocation,
                      width: 60,
                      height: 60,
                      child: const Icon(Icons.location_pin,
                          color: Colors.red, size: 40),
                    ),
                  ],
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: [pickupLocation, dropoffLocation],
                      strokeWidth: 4.0,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
           Align(
  alignment: Alignment.bottomCenter,
  child: Container(
    padding: const EdgeInsets.all(16),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- Driver Information ---
        const Text(
          "Driver Information",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/driver.jpg"), // adjust as needed
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(driverInfo['name'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text(driverInfo['car'], style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.message, color: AppColors.primary),
                  onPressed: controller.messageDriver,
                ),
                IconButton(
                  icon: const Icon(Icons.call, color: AppColors.primary),
                  onPressed: controller.callDriver,
                ),
                IconButton(
                  icon: const Icon(Icons.share, color: AppColors.primary),
                  onPressed: controller.shareRideDetails, // optional
                ),
              ],
            )
          ],
        ),

        const SizedBox(height: 16),

        // --- Order Information ---
        const Text(
          "Order Information",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_pin, color: Colors.orange),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(pickupAddress, style: const TextStyle(fontSize: 14)),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_pin, color: Colors.blue),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(dropoffAddress, style: const TextStyle(fontSize: 14)),
                  )
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: controller.cancelRide,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text("Cancel", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    ),
  ),
),

          ],
        );
      }),
    );
  }
}

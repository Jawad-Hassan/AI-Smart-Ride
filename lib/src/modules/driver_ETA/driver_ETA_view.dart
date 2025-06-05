import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/driver_ETA/driver_ETA_logic.dart';
import 'package:flutter_application_1/src/modules/utlis/app_colors.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class DriverETAView extends StatelessWidget {
  final Map<String, dynamic> driverInfo;
  final LatLng driverLocation;
  final LatLng pickupLocation;
  final LatLng dropoffLocation;
  final String pickupAddress;
  final String dropoffAddress;

  const DriverETAView({
    Key? key,
    required this.driverInfo,
    required this.driverLocation,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.pickupAddress,
    required this.dropoffAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DriverETAController(
      driverInfo: driverInfo,
      driverLocation: driverLocation,
      pickupLocation: pickupLocation,
      dropoffLocation: dropoffLocation,
      pickupAddress: pickupAddress,
      dropoffAddress: dropoffAddress,
    ));

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(center: pickupLocation, zoom: 15),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: driverLocation,
                    width: 50,
                    height: 50,
                    child: const Icon(Icons.local_taxi, color: Colors.orange, size: 36),
                  ),
                  Marker(
                    point: pickupLocation,
                    width: 50,
                    height: 50,
                    child: const Icon(Icons.person_pin_circle, color: Colors.green, size: 36),
                  ),
                ],
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: [driverLocation, pickupLocation],
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
                  const Text("Driver Information", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/driver.jpg"),
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
                            onPressed: controller.shareRideDetails,
                          ),
                        ],
                      ),
                      Obx(() => Text(
                        "${controller.secondsLeft.value}s",
                        style: const TextStyle(fontSize: 18, color: Colors.red),
                      )),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text("Order Information", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                            Expanded(child: Text(pickupAddress)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.location_pin, color: Colors.blue),
                            const SizedBox(width: 8),
                            Expanded(child: Text(dropoffAddress)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () => Get.back(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
      ),
    );
  }
}

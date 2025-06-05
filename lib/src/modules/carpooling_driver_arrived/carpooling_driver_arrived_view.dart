import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/carpooling_driver_arrived/carpooling_driver_arrived_logic.dart';
import 'package:flutter_application_1/src/modules/choose_ride_carpooling/choose_ride_carpooling_view.dart';
import 'package:flutter_application_1/src/modules/order_info_carpooling/order_info_carpooling_view.dart';
import 'package:flutter_application_1/src/modules/utlis/app_colors.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class CarpoolingDriverArrivedView extends StatelessWidget {
  final Map<String, dynamic> driverInfo;
  final LatLng pickupLocation;
  final LatLng dropoffLocation;
  final String pickupAddress;
  final String dropoffAddress;

  const CarpoolingDriverArrivedView({
    Key? key,
    required this.driverInfo,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.pickupAddress,
    required this.dropoffAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CarpoolingDriverArrivedController(
      driverInfo: driverInfo,
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
                    point: pickupLocation,
                    width: 50,
                    height: 50,
                    child: const Icon(Icons.location_pin, color: Colors.green, size: 36),
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
                  const Text("Driver Arrived", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                      Obx(() {
                        final minutes = (controller.secondsLeft.value ~/ 60).toString().padLeft(2, '0');
                        final seconds = (controller.secondsLeft.value % 60).toString().padLeft(2, '0');
                        return Text("$minutes:$seconds", style: const TextStyle(fontSize: 18, color: Colors.red));
                      }),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text("Pickup Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Cancel Button
                     ElevatedButton(
  onPressed: () {
                          Get.to(() => ChooseRideCarpoolingView(
                                pickupLocation: pickupLocation,
                                dropoffLocation: dropoffLocation,
                                pickupAddress: pickupAddress,
                                dropoffAddress: dropoffAddress,
                              ));
                        },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  ),
  child: const Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    child: Text("Cancel", style: TextStyle(color: Colors.white)),
  ),
),
                      // OK Coming Button
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => DriverTrackingCarpoolingView(
                                driverInfo: driverInfo,
                                pickupLocation: pickupLocation,
                                dropoffLocation: dropoffLocation,
                                pickupAddress: pickupAddress,
                                dropoffAddress: dropoffAddress,
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          child: Text("OK, Coming", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
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

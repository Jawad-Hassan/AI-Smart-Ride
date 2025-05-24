import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/Home_Page/homepage_view.dart';
import 'package:flutter_application_1/src/modules/ride_summary/ride_summary_logic.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';// Make sure to import your controller

class RideSummaryView extends StatelessWidget {
  final Map<String, dynamic> driverInfo;
  final int fare;
  final LatLng pickupLocation;
  final LatLng dropoffLocation;

  RideSummaryView({
    Key? key,
    required this.driverInfo,
    required this.fare,
    required this.pickupLocation,
    required this.dropoffLocation,
  }) : super(key: key);

  final RideSummaryController controller = Get.put(RideSummaryController());

  @override
  Widget build(BuildContext context) {
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
                    width: 40,
                    height: 40,
                    child: const Icon(Icons.location_pin, color: Colors.green, size: 40),
                  ),
                  Marker(
                    point: dropoffLocation,
                    width: 40,
                    height: 40,
                    child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
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
                  const Text("Driver Information", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/driver_avatar.png'),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(driverInfo['name'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                            Text(driverInfo['car']),
                          ],
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     IconButton(icon: const Icon(Icons.message, color: Colors.blue), onPressed: () {}),
                      //     IconButton(icon: const Icon(Icons.call, color: Colors.blue), onPressed: () {}),
                      //   ],
                      // ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text("Payment : Rs $fare", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text("Rate your ride:"),
                  const SizedBox(height: 8),
                 Obx(() {
  return Row(
    children: List.generate(
      5,
      (index) => IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        icon: Icon(
          index < controller.rating.value ? Icons.star : Icons.star_border,
          color: Colors.orange,
          size: 28,
        ),
        onPressed: () => controller.setRating(index + 1),
      ),
    ),
  );
}),

                  const SizedBox(height: 10),
                  const Text("Comment:"),
                  const SizedBox(height: 6),
                  TextField(
                    controller: controller.commentController,
                    decoration: InputDecoration(
                      hintText: "Write",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: controller.submitRating,
                      child: const Text("End Ride", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

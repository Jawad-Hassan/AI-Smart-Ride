import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/order_info_carpooling/order_info_carpooling_logic.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class DriverTrackingCarpoolingView extends StatelessWidget {
  final Map<String, dynamic> driverInfo;
  final LatLng pickupLocation;
  final LatLng dropoffLocation;
  final String pickupAddress;
  final String dropoffAddress;

  final DriverTrackingCarpoolingController controller = Get.find<DriverTrackingCarpoolingController>();

  DriverTrackingCarpoolingView({
    Key? key,
    required this.driverInfo,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.pickupAddress,
    required this.dropoffAddress,
  }) : super(key: key);

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
              options: MapOptions(center: controller.driverLocation.value, zoom: 13),
              children: [
                TileLayer(urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png", userAgentPackageName: 'com.example.app'),
                MarkerLayer(
                  markers: [
                    Marker(point: controller.driverLocation.value, width: 60, height: 60, child: const Icon(Icons.local_taxi, color: Colors.orange, size: 40)),
                    Marker(point: pickupLocation, width: 60, height: 60, child: const Icon(Icons.location_pin, color: Colors.green, size: 40)),
                    Marker(point: dropoffLocation, width: 60, height: 60, child: const Icon(Icons.location_pin, color: Colors.red, size: 40)),
                  ],
                ),
                PolylineLayer(polylines: [Polyline(points: [pickupLocation, dropoffLocation], strokeWidth: 4.0, color: Colors.blue)]),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 280,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Driver on the way", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const CircleAvatar(child: Icon(Icons.person)),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(driverInfo['name'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                            Text(driverInfo['car']),
                            Text("⭐ ${driverInfo['rating']}"),
                            const SizedBox(height: 8),
                            Text("From: $pickupAddress", style: const TextStyle(fontSize: 12)),
                            Text("To: $dropoffAddress", style: const TextStyle(fontSize: 12)),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(children: [const Icon(Icons.location_on, color: Colors.green), const SizedBox(height: 4), Text("Pickup:\n$pickupAddress", textAlign: TextAlign.center, style: const TextStyle(fontSize: 12))]),
                        Column(children: [const Icon(Icons.access_time, color: Colors.blue), const SizedBox(height: 4), Text("ETA: ${controller.eta.value}")]),
                        Column(children: [const Icon(Icons.pin_drop, color: Colors.red), const SizedBox(height: 4), Text("Dropoff:\n$dropoffAddress", textAlign: TextAlign.center, style: const TextStyle(fontSize: 12))]),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(icon: const Icon(Icons.message), label: const Text("Message"), onPressed: controller.messageDriver),
                        ElevatedButton.icon(icon: const Icon(Icons.call), label: const Text("Call"), onPressed: controller.callDriver),
                        ElevatedButton.icon(icon: const Icon(Icons.cancel), label: const Text("Cancel"), style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent), onPressed: controller.cancelRide),
                      ],
                    )
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

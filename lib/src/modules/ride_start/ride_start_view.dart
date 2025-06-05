import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/MessagePassenger/message_passenger_view.dart';
import 'package:flutter_application_1/src/modules/customwidget/custom_button.dart';
import 'package:flutter_application_1/src/modules/ride_start/ride_start_logic.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class RideStartView extends StatelessWidget {
  final logic = Get.put(RideStartLogic());

  @override
  Widget build(BuildContext context) {
    final LatLng yourLocation = logic.yourLocation;
    final LatLng destinationLocation = logic.destinationLocation;
    final String pickup = logic.pickup;
    final String dropoff = logic.dropoff;
    final String riderName = logic.riderName;
    final String eta = logic.eta;
    final String riderImage = logic.riderImage;
    final String offeredPrice = logic.offeredPrice;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 🗺️ Map showing current location and destination
            Container(
              height: 300,
              width: double.infinity,
              child: FlutterMap(
                options: MapOptions(
                  center: yourLocation,
                  zoom: 13,
                ),
                children: [
                  TileLayer(
                    urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: yourLocation,
                        width: 40,
                        height: 40,
                        child: const Icon(Icons.directions_car, color: Colors.green, size: 40),
                      ),
                      Marker(
                        point: destinationLocation,
                        width: 40,
                        height: 40,
                        child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
                      ),
                    ],
                  ),
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: [yourLocation, destinationLocation],
                        strokeWidth: 4.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 👇 Info Panel
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ride Started", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(riderImage),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(riderName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                            Text(eta, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.message),
                              onPressed: () {
                                Get.to(() => PassengerChattingScreenView());
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.phone),
                              onPressed: () {
                                // Optional: call functionality
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text("Destination", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 10),
                    Text("Pick-up Location: $pickup"),
                    Text("Drop-off Location: $dropoff"),
                    SizedBox(height: 10),
                    Text("Offered Price: Rs. $offeredPrice", style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    CustomButton(
                      text: "Ride Start",
                      onPressed: logic.startRide,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

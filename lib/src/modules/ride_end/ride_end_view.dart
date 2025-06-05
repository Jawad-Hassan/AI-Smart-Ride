import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/MessagePassenger/message_passenger_view.dart';
import 'package:flutter_application_1/src/modules/customwidget/custom_button.dart';
import 'package:flutter_application_1/src/modules/ride_end/ride_end_logic.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class RideEndView extends StatelessWidget {
  final logic = Get.put(RideEndLogic());

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
            // 🗺️ Map View
            Container(
              height: 300,
              width: double.infinity,
              child: FlutterMap(
                options: MapOptions(
                  center: destinationLocation,
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
                        point: destinationLocation,
                        width: 40,
                        height: 40,
                        child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 👇 Ride Summary & End Button
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
                    Text("Arrived at Destination", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
                            IconButton(icon: Icon(Icons.phone), onPressed: () {}),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text("Trip Summary", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 10),
                    Text("Pick-up Location: $pickup"),
                    Text("Drop-off Location: $dropoff"),
                    SizedBox(height: 10),
                    Text("Offered Price: Rs. $offeredPrice", style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    CustomButton(
                      text: "End Ride",
                      onPressed: logic.endRide,
                      backgroundColor: Colors.red,
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

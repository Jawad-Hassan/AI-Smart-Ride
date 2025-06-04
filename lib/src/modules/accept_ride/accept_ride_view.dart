import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/MessagePassenger/message_passenger_view.dart';
import 'package:flutter_application_1/src/modules/accept_ride/accept_ride_logic.dart';
import 'package:flutter_application_1/src/modules/ride_start/ride_start_view.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_application_1/src/modules/customwidget/custom_button.dart';

class UserInformationView extends StatelessWidget {
  final logic = Get.put(UserInformationLogic());

  // Example pickup and dropoff points (you can replace these with real values)
  final LatLng pickup = LatLng(33.6844, 73.0479);   // Islamabad
  final LatLng dropoff = LatLng(33.6938, 73.0652);  // Another point

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ✅ Map View using flutter_map
            Container(
              height: 300,
              width: double.infinity,
              child: FlutterMap(
                options: MapOptions(
                  center: pickup,
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
                        point: pickup,
                        width: 40,
                        height: 40,
                        child: const Icon(Icons.location_pin, color: Colors.green, size: 40),
                      ),
                      Marker(
                        point: dropoff,
                        width: 40,
                        height: 40,
                        child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
                      ),
                    ],
                  ),
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: [pickup, dropoff],
                        strokeWidth: 4.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // 👇 Bottom Sheet Area
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
                    Text("Ride Information", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(logic.riderImage),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(logic.riderName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                            Text(logic.eta, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
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
                    Text("Order Information", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 10),
                    Text("Pick-up Location: ${logic.pickup}"),
                    Text("Drop-off Location: ${logic.dropoff}"),
                    SizedBox(height: 10),
                    Text("Offered Price: Rs. ${logic.offeredPrice}", style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    CustomButton(
  text: "Arrived",
  onPressed: logic.goToRideStart,
  backgroundColor: Colors.blue,
  textColor: Colors.white,
),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

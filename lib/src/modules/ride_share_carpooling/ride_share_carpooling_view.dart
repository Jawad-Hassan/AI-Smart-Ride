import 'package:flutter/material.dart';


import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_application_1/src/modules/utlis/app_colors.dart';

class RideShareCarpoolingView extends StatelessWidget {
  final Map<String, dynamic> driverInfo;
  final String pickupAddress;
  final String dropoffAddress;
  final String trackingURL;

  const RideShareCarpoolingView({
    Key? key,
    required this.driverInfo,
    required this.pickupAddress,
    required this.dropoffAddress,
    required this.trackingURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final driverName = driverInfo['name'] ?? 'Unknown';
    final vehicleInfo = driverInfo['car'] ?? 'N/A';

    return Scaffold(
      appBar: AppBar(title: const Text("Share Ride Info"), backgroundColor: AppColors.primary),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Driver", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ListTile(
              leading: const CircleAvatar(backgroundImage: AssetImage("assets/images/driver.jpg")),
              title: Text(driverName),
              subtitle: Text(vehicleInfo),
            ),
            const SizedBox(height: 10),
            const Text("Pickup", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(pickupAddress),
            const SizedBox(height: 10),
            const Text("Dropoff", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(dropoffAddress),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () async {
                final message = Uri.encodeComponent(
                  "Hey! I have booked a ride on SmartRide!\n"
                  "Driver: $driverName\n"
                  "Vehicle: $vehicleInfo\n"
                  "Track: $trackingURL"
                );
                final url = Uri.parse("https://wa.me/?text=$message");
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("WhatsApp not available")));
                }
              },
              icon: const Icon(Icons.share),
              label: const Text("Share on WhatsApp"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}


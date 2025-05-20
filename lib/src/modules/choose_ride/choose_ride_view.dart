import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/choose_ride/choose_ride_logic.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/modules/customwidget/custom_button.dart';
import 'package:flutter_application_1/src/modules/pick_drop/pick_drop_view.dart';


class ChooseRideView extends StatelessWidget {
  final ChooseRideController controller = Get.put(ChooseRideController());
  
  final LatLng pickupLocation = LatLng(24.8607, 67.0011);
  final LatLng dropoffLocation = LatLng(24.8650, 67.0600);
  final String fare; // ✅ Add this
ChooseRideView({super.key, this.fare = "Rs. 0"}); 


@override
Widget build(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final bottomContainerHeight = screenHeight * 0.4; // 40% of screen height

  return Scaffold(
    body: Stack(
      children: [
        FlutterMap(
          options: MapOptions(center: pickupLocation, zoom: 13.0),
          children: [
            // ... your map layers ...
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: bottomContainerHeight,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(24)),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Choose a ride",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  // Instead of Expanded here, use Flexible so it adapts well
                  Flexible(
                    child: controller.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : controller.rideOffers.isEmpty
                            ? const Center(child: Text("No offers yet"))
                            : ListView.builder(
                                itemCount: controller.rideOffers.length,
                                itemBuilder: (context, index) {
                                  final offer = controller.rideOffers[index];
                                  return Card(
                                    elevation: 2,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.all(12),
                                      leading: const CircleAvatar(
                                        radius: 24,
                                        backgroundImage: NetworkImage(
                                            'https://via.placeholder.com/150'),
                                      ),
                                      title: Text(
                                        "${offer['name']} (⭐ ${offer['rating']})",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(offer['car']),
                                      trailing: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("PKR ${offer['price']}",
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold)),
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomButton(
                                                text: "Decline",
                                                onPressed:
                                                    controller.declineRide,
                                                backgroundColor:
                                                    Colors.red.shade100,
                                                textColor:
                                                    Colors.red.shade800,
                                                width: 100,
                                                height: 20,
                                                fontSize: 12,
                                              ),
                                              const SizedBox(width: 8),
                                              CustomButton(
                                                text: "Accept",
                                                onPressed: () =>
                                                    controller.acceptRide(
                                                        offer['name']),
                                                backgroundColor:
                                                    Colors.green.shade100,
                                                textColor:
                                                    Colors.green.shade800,
                                                width: 100,
                                                height: 20,
                                                fontSize: 12,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                  ),

                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.credit_card, size: 18),
                          SizedBox(width: 5),
                          Text(fare, style: TextStyle(fontSize: 15)),
                        ],
                      ),
                      CustomButton(
                        text: "Stop Search",
                        onPressed: () {
                          Get.to(() => const PickDropView());
                        },
                        width: 200,
                        height: 40,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    ),
  );
}

}

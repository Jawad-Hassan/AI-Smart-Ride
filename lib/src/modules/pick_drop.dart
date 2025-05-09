import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/customwidget/custom_button.dart';
import 'package:flutter_application_1/src/modules/utlis/app_images.dart';

class PickDropPage extends StatefulWidget {
  const PickDropPage({super.key});

  @override
  State<PickDropPage> createState() => _PickDropPageState();
}

class _PickDropPageState extends State<PickDropPage> {
  final TextEditingController pickupController = TextEditingController();
  final TextEditingController dropoffController = TextEditingController();
  final TextEditingController fareController = TextEditingController();

  bool autoAccept = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Image with Text Overlay at Top Left
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    AppImages.pick_drop,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back, color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Enter Pickup and Dropoff",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Input Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Pickup
                    TextField(
                      controller: pickupController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.location_on_outlined, color: Colors.red),
                        hintText: 'Search Pickup Location',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Dropoff
                    TextField(
                      controller: dropoffController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.location_on, color: Colors.blue),
                        hintText: 'Search Dropoff Location',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Fare
                    TextField(
                      controller: fareController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Fare',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Auto Accept Switch
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Auto-accept for written fare?"),
                        Switch(
                          value: autoAccept,
                          onChanged: (val) {
                            setState(() {
                              autoAccept = val;
                            });
                          },
                        )
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Search Button
                    CustomButton(
                      text: "Search",
                      onPressed: () {
                        // handle search logic
                      },
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                      borderRadius: 12,
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

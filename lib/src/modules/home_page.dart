import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/chat_page.dart';
import 'package:flutter_application_1/src/modules/customwidget/custom_bottom_navbar.dart';
import 'package:flutter_application_1/src/modules/customwidget/custom_button.dart';
import 'package:flutter_application_1/src/modules/history.dart';
import 'package:flutter_application_1/src/modules/pick_drop.dart';
import 'package:flutter_application_1/src/modules/utlis/app_fonts.dart';
import 'package:flutter_application_1/src/modules/utlis/app_images.dart'; // Assuming this is the correct path

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image banner with text overlay
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Image.asset(
                      AppImages.top,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 16,
                    bottom: 150,
                    child: Text(
                      'Welcome to SmartRide',
                      style: StyleRefer.poppinsBold.copyWith(
                        fontSize: 22,
                        color: Colors.white,
                        shadows: [
                          const Shadow(
                            offset: Offset(0, 1),
                            blurRadius: 4,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Services Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Services',
                  style: StyleRefer.poppinsSemiBold.copyWith(
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Horizontally scrollable Service Buttons
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    _buildServiceButton(
                      color: Colors.white,
                      label: 'Mini Ride',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PickDropPage()),
                        );
                      },
                    ),
                    const SizedBox(width: 12),
                    _buildServiceButton(
                      color: Colors.yellow,
                      label: 'Ride AC',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PickDropPage()),
                        );
                      },
                    ),
                    const SizedBox(width: 12),
                    _buildServiceButton(
                      color: Colors.red,
                      label: 'Bike',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PickDropPage()),
                        );
                      },
                    ),
                    const SizedBox(width: 12),
                    _buildServiceButton(
                      color: Colors.blue,
                      label: 'Rickshaw',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PickDropPage()),
                        );
                      },
                    ),
                    const SizedBox(width: 12),
                    _buildServiceButton(
                      color: Colors.pink,
                      label: 'Carpooling',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PickDropPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Recommendations Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Recommendations',
                  style: StyleRefer.poppinsSemiBold.copyWith(
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Horizontally scrollable Recommendations
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    _buildRecommendationCard('Explore City Tours'),
                    const SizedBox(width: 12),
                    _buildRecommendationCard('Try SmartRide Carpool'),
                    const SizedBox(width: 12),
                    _buildRecommendationCard('Discounted AC Rides'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == _selectedIndex) return;
          setState(() => _selectedIndex = index);

          switch (index) {
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HistoryScreen()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const GroupChatScreen()),
              );
              break;
          }
        },
      ),
    );
  }

  Widget _buildServiceButton({
    required Color color,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: CustomButton(
            text: '',
            onPressed: onPressed,
            backgroundColor: color,
            borderRadius: 12,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: StyleRefer.poppinsRegular.copyWith(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildRecommendationCard(String title) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // The card content
          Text(
            title,
            style: StyleRefer.poppinsRegular.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

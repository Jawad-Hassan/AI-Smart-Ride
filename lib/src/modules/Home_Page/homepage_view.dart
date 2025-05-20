import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/History_screen/history_view.dart';
import 'package:flutter_application_1/src/modules/Home_Page/homepage_logic.dart';
import 'package:flutter_application_1/src/modules/carpooling_pick_drop/carpooling_pick_drop_view.dart';
import 'package:flutter_application_1/src/modules/chat_page/chat_page_view.dart';
import 'package:flutter_application_1/src/modules/pick_drop/pick_drop_view.dart';
import 'package:get/get.dart';

import 'package:flutter_application_1/src/modules/customwidget/custom_bottom_navbar.dart';
import 'package:flutter_application_1/src/modules/customwidget/custom_button.dart';
import 'package:flutter_application_1/src/modules/utlis/app_fonts.dart';
import 'package:flutter_application_1/src/modules/utlis/app_images.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Obx(() {
              switch (controller.selectedIndex.value) {
                case 0:
                  return _buildHomeContent(context);
                case 1:
                  return  HistoryView();
                case 2:
                  return const GroupChatScreen();
                default:
                  return _buildHomeContent(context);
              }
            }),
          ),
          bottomNavigationBar: Obx(() => CustomBottomNavBar(
                currentIndex: controller.selectedIndex.value,
                onTap: controller.onNavTapped,
              )),
        );
      },
    );
  }

  Widget _buildHomeContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.asset(AppImages.top, fit: BoxFit.cover),
              ),
              Positioned(
                left: 16,
                bottom: 150,
                child: Text(
                  'Welcome to SmartRide',
                  style: StyleRefer.poppinsBold.copyWith(
                    fontSize: 22,
                    color: Colors.white,
                    shadows: const [
                      Shadow(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Services',
              style: StyleRefer.poppinsSemiBold.copyWith(fontSize: 20),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                _buildServiceButton('Mini Ride', Colors.white, context),
                const SizedBox(width: 12),
                _buildServiceButton('Ride AC', Colors.yellow, context),
                const SizedBox(width: 12),
                _buildServiceButton('Bike', Colors.red, context),
                const SizedBox(width: 12),
                _buildServiceButton('Rickshaw', Colors.blue, context),
                const SizedBox(width: 12),
                _buildServiceButton('Carpooling', Colors.pink, context),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Recommendations',
              style: StyleRefer.poppinsSemiBold.copyWith(fontSize: 20),
            ),
          ),
          const SizedBox(height: 16),
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
    );
  }

  Widget _buildServiceButton(String label, Color color, BuildContext context) {
  return Column(
    children: [
      SizedBox(
        width: 80,
        height: 80,
        child: CustomButton(
          text: '',
          onPressed: () {
            if (label == 'Carpooling') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CarpoolingPickDropView()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PickDropView()),
              );
            }
          },
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
          Text(
            title,
            style: StyleRefer.poppinsRegular.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

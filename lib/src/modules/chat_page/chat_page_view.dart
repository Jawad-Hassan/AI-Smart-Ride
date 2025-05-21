import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/chat_page/chat_page_logic.dart';
import 'package:flutter_application_1/src/modules/chatting_screen/chatting_screen_view.dart';
import 'package:flutter_application_1/src/modules/customwidget/custom_button.dart';
import 'package:get/get.dart';

import 'package:flutter_application_1/src/modules/utlis/app_fonts.dart';
import 'package:flutter_application_1/src/modules/utlis/app_images.dart';

class GroupChatScreen extends StatelessWidget {
  const GroupChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatPageLogic());

    return Scaffold(
      // bottomNavigationBar: CustomBottomNavBar(
      //   currentIndex: controller.currentIndex,
      //   onTap: (index) => controller.onNavTapped(index, context),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    children: [
                      Text(
                        'SmartRide',
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
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Your groups',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 36,
                    child: CustomButton(
                      text: 'Himalayas Trip',
                      onPressed: () {
                        // Add your button action here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChattingScreenView()),
                        );
                      },
                      backgroundColor: Colors.white,
                      textColor: Colors.blue.shade800,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      borderRadius: 20,
                      width: 150,
                      height: 36,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text('59 members',
                      style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Recommendations',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildRecommendationCard('Beach Tour\n21–26 Jan'),
                  _buildRecommendationCard('Village Tour\n30 Mar – 4 Apr'),
                  _buildRecommendationCard('City Meetup\nEvery Sunday'),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Create Group screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Create Group'),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationCard(String label) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.group_add, size: 50, color: Colors.blue),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              // Join group logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: const Text('Join'),
          ),
        ],
      ),
    );
  }
}

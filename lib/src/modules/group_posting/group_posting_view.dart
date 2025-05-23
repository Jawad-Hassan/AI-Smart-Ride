// group_posting_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/customwidget/custom_button.dart';
import 'package:get/get.dart';
import 'group_posting_logic.dart';

class GroupPostingView extends StatelessWidget {
  final logic = Get.put(GroupPostingLogic());

  GroupPostingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/top.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Get.back(),
                  ),
                ),
                const Positioned(
                  top: 100,
                  left: 16,
                  child: Text(
                    'Create a group!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: logic.groupNameController,
                      decoration: const InputDecoration(
                        hintText: "Write name of group",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: logic.dateTimeController,
                      decoration: const InputDecoration(
                        hintText: "Write time and date",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: logic.detailsController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: "Write details of trip",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomButton(
                text: "Post",
                onPressed: () {
                  logic.postGroup();
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

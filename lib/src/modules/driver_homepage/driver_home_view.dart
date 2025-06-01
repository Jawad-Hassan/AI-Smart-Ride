import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/customwidget/custom_button.dart';
import 'package:flutter_application_1/src/modules/driver_activerequestpage/active_request_view.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/modules/utlis/app_fonts.dart';
import 'package:flutter_application_1/src/modules/utlis/app_images.dart';


import '../driver_histroypage/driver_history_view.dart';
import 'driver_home_logic.dart';

class DriverHomePageView extends StatelessWidget {
  final logic = Get.put(DriverHomeLogic());

  final RxInt _selectedIndex = 0.obs;

  final List<Widget> _pages = [
    HomePageBody(), // Home content
    DriverHistoryPage(),
    DriverActiveRequestView(),
  ];

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text(
                    'Driver Menu',
                    style: StyleRefer.poppinsBold.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    _onItemTapped(0);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.list_alt),
                  title: Text('History'),
                  onTap: () {
                    _onItemTapped(1);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.chat_bubble_outline),
                  title: Text('Active Request'),
                  onTap: () {
                    _onItemTapped(2);
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: CustomButton(
                    text: 'Passenger Mode',
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      // TODO: Add logout logic here
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          body: _pages[_selectedIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex.value,
            onTap: _onItemTapped,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home,
                    color:
                        _selectedIndex.value == 0 ? Colors.blue : Colors.grey),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt,
                    color:
                        _selectedIndex.value == 1 ? Colors.blue : Colors.grey),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline,
                    color:
                        _selectedIndex.value == 2 ? Colors.blue : Colors.grey),
                label: 'Active Request',
              ),
            ],
          ),
        ));
  }
}

class HomePageBody extends StatelessWidget {
  final logic = Get.find<DriverHomeLogic>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top image with Home text and aligned Drawer button
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Image.asset(AppImages.top, fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Builder(
                      builder: (context) => GestureDetector(
                        onTap: () => Scaffold.of(context).openDrawer(),
                        child: Row(
                          children: [
                            Icon(Icons.menu, color: Colors.white, size: 28),
                            SizedBox(width: 10),
                            Text(
                              'Home',
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
                    ),
                  ),
                ],
              ),

              // Scrollable ride buttons
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: logic.rideList.map((ride) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CustomButton(
                          onPressed: () {
                            // Optional: handle tap on whole card
                          },
                          backgroundColor: Colors.white,
                          borderColor: Colors.grey.shade300,
                          textColor: Colors.black,
                          height: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Ride Info
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ride.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text('${ride.distance} km'),
                                      Text(ride.route),
                                    ],
                                  ),
                                  // Fare Box
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade900,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      'PKR ${ride.fare}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              // Accept & Join buttons row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomButton(
                                    width: 100,
                                    height: 36,
                                    text: 'Accept',
                                    backgroundColor: Colors.blue,
                                    fontSize: 14,
                                    borderRadius: 8,
                                    onPressed: () {
                                      Get.to(() => DriverActiveRequestView(),
                                          arguments: ride);
                                    },

                                  ),
                                  SizedBox(width: 12),
                                  CustomButton(
                                    width: 100,
                                    height: 36,
                                    text: 'Join',
                                    backgroundColor: Colors.blue,
                                    fontSize: 14,
                                    borderRadius: 8,
                                    onPressed: () {
                                      // TODO: Join action
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}


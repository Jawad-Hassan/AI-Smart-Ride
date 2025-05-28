import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/Home_Page/homepage_view.dart';
import 'package:flutter_application_1/src/modules/driver_login/driver_login_view.dart';
import 'package:flutter_application_1/src/modules/driver_signUp/driver_sign_view.dart';
import 'package:flutter_application_1/src/modules/driver_verification_page/driver_verification_view.dart';

import 'package:flutter_application_1/src/modules/login_page/login_view.dart';
import 'package:flutter_application_1/src/modules/signup_page/sign_view.dart';
import 'package:flutter_application_1/src/modules/user_verification_page/verification_view.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/modules/Welcome_Page.dart';
// <-- import if you have this

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartRide',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomePage(),

      // 👇 Add named routes here
      getPages: [
        // GetPage(name: '/login', page: () => const LoginView()),
        GetPage(
            name: '/signup', page: () => const SignView()), // if implemented
        GetPage(name: '/verification', page: () => const VerificationView()),
        GetPage(
            name: '/home',
            page: () => const HomePageView()), // <-- Add this line
        GetPage(name: '/driverLogin', page: () => const DriverLoginView()),
        GetPage(name: '/passengerLogin', page: () => const LoginView()),
        GetPage(name: '/driververification', page: () => const DriverVerificationView()),
        GetPage(name: '/driversignup', page: () => const DriverSignView()),
      ],
    );
  }
}

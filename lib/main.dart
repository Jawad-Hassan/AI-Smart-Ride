import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/Home_Page/homepage_view.dart';
import 'package:flutter_application_1/src/modules/chat_page/chat_page_view.dart';
import 'package:flutter_application_1/src/modules/driver_login/driver_login_view.dart';
import 'package:flutter_application_1/src/modules/driver_verification/driver_verification_view.dart';
import 'package:flutter_application_1/src/modules/login_page/login_view.dart';
import 'package:flutter_application_1/src/modules/passenger_verification/passenger_verification_view.dart';
import 'package:flutter_application_1/src/modules/signup_choice/signup_choice_view.dart';
import 'package:flutter_application_1/src/modules/signup_page/sign_view.dart';
import 'package:flutter_application_1/src/modules/signup_verification_page/verification_view.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/modules/Welcome_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const WelcomePage(),

      // Add named routes here
      getPages: [
        GetPage(name: '/passengerLogin', page: () => const LoginView()),
        GetPage(name: '/driverLogin', page: () => const DriverLoginView()),
        GetPage(name: '/driverVerification', page: () => const DriverVerificationView()),
        GetPage(name: '/passengerVerification', page: () => const PassengerVerificationView()),
        GetPage(name: '/signup', page: () => const SignView()), // if implemented
        GetPage(name: '/signupChoice', page: () => const SignUpTypeSelectionView()), // if implemented
        GetPage(name: '/verification', page: () => const VerificationView()),
        GetPage(name: '/home', page: () => const HomePageView()),
        GetPage(name: '/group-chat', page: () => GroupChatScreen()),
         // <-- Add this line

      ],
    );
  }
}

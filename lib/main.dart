import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/Home_Page/homepage_view.dart';
import 'package:flutter_application_1/src/modules/chat_page/chat_page_view.dart';
import 'package:flutter_application_1/src/modules/driverSignUpverification/driver_signupVerification_view.dart';
import 'package:flutter_application_1/src/modules/driver_Signup/driver_signup_view.dart';
import 'package:flutter_application_1/src/modules/driver_activerequestpage/active_request_logic.dart';
import 'package:flutter_application_1/src/modules/driver_activerequestpage/active_request_view.dart';
import 'package:flutter_application_1/src/modules/driver_doc_upload/driver_doc_view.dart';
import 'package:flutter_application_1/src/modules/driver_homepage/driver_home_view.dart';

import 'package:flutter_application_1/src/modules/driver_login/driver_login_view.dart';
import 'package:flutter_application_1/src/modules/driver_verification/driver_verification_view.dart';
import 'package:flutter_application_1/src/modules/login_page/login_view.dart';
import 'package:flutter_application_1/src/modules/passenger-signup/passenger_signup_view.dart';
import 'package:flutter_application_1/src/modules/passenger_signup_verifcation/passenger_signup_verifcation_view.dart';
import 'package:flutter_application_1/src/modules/passenger_verification/passenger_verification_view.dart';
import 'package:flutter_application_1/src/modules/signup_choice/signup_choice_view.dart';
import 'package:flutter_application_1/src/modules/signup_page/sign_view.dart';
import 'package:flutter_application_1/src/modules/signup_verification_page/verification_view.dart';

import 'package:get/get.dart';
import 'package:flutter_application_1/src/modules/Welcome_Page.dart';

void main() {
  // Global put in case accessed outside route

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
        home: WelcomePage(), // Do not change this

        // Define all routes including active-request
        getPages: [
          GetPage(name: '/passengerLogin', page: () => const LoginView()),
          GetPage(name: '/driverLogin', page: () => const DriverLoginView()),
          GetPage(
              name: '/driverVerification',
              page: () => const DriverVerificationView()),
          GetPage(
              name: '/passengerVerification',
              page: () => const PassengerVerificationView()),
          GetPage(name: '/signup', page: () => const SignView()),
          GetPage(
              name: '/signupChoice',
              page: () => const SignUpTypeSelectionView()),
          GetPage(name: '/verification', page: () => const VerificationView()),
          GetPage(name: '/home', page: () => const HomePageView()),
          GetPage(name: '/group-chat', page: () => GroupChatScreen()),
          GetPage(name: '/driver-signup', page: () => DriverSignUpView()),
          GetPage(name: '/passenger-signup', page: () => PassengerSignUpView()),
          GetPage(
              name: '/driver-signup-verification',
              page: () => DriverSignUpVerificationView()),
          GetPage(
              name: '/passenger-signup-verification',
              page: () => PassengerSignUpVerificationView()),
          GetPage(name: '/doc-verification', page: () => DocVerificationView()),
          GetPage(name: '/driver-home', page: () => DriverHomePageView()),
          GetPage(
            name: '/active-request',
            page: () => const DriverActiveRequestView(),
            binding: BindingsBuilder(() {
              Get.lazyPut(() => DriverActiveRequestLogic());
            }),
          ),
        ]);
  }
}

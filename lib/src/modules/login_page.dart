import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/modules/customwidget/textfields.dart';
import 'package:flutter_application_1/src/modules/signup_page.dart';

import 'package:flutter_application_1/src/modules/utlis/app_colors.dart';
import 'package:flutter_application_1/src/modules/utlis/app_fonts.dart';
import 'package:flutter_application_1/src/modules/utlis/app_icons.dart';
import 'package:flutter_application_1/src/modules/utlis/app_images.dart';
import 'package:flutter_application_1/src/modules/utlis/app_strings.dart';
import 'package:flutter_application_1/src/modules/verification_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 800 / 230,
                child: Image.asset(
                  AppImages.bg,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Texts.login,
                      style: StyleRefer.poppinsBold.copyWith(
                        fontSize: 22,
                        color: AppColorss.text,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      Texts.belowLogin,
                      style: StyleRefer.poppinsRegular.copyWith(
                        fontSize: 14,
                        color: AppColorss.text.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Textfield(
                      hintKey: AppHints.phoneNumber,
                      icon: AppIconss.phone,
                      controller: phoneController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 11,
                      inputType: TextInputType.phone,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const VerificationScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColorss.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          Texts.login,
                          style: StyleRefer.poppinsSemiBold.copyWith(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()),
                          );
                        },
                        child: Text(
                          Texts.signUpOptionInLogin,
                          style: StyleRefer.poppinsRegular.copyWith(
                            fontSize: 13,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

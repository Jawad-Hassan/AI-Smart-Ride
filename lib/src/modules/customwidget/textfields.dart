import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_application_1/src/modules/utlis/app_colors.dart';
import 'package:flutter_application_1/src/modules/utlis/app_fonts.dart';

class Textfield extends StatelessWidget {
  final String hintKey;
  final IconData? icon;
  final TextEditingController? controller;
  final bool isObscure;
  final TextInputType inputType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final String? Function(String?)? validator; // <-- Add this

  const Textfield({
    super.key,
    required this.hintKey,
    this.icon,
    this.controller,
    this.isObscure = false,
    this.inputType = TextInputType.text,
    this.inputFormatters,
    this.maxLength,
    this.validator, // <-- Add this
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      keyboardType: inputType,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      validator: validator, // <-- Pass it here
      style: StyleRefer.poppinsRegular.copyWith(
        color: AppColorss.text,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: hintKey,
        hintStyle: StyleRefer.poppinsRegular.copyWith(
          color: AppColorss.text.withOpacity(0.6),
          fontSize: 14,
        ),
        prefixIcon: icon != null ? Icon(icon, color: AppColorss.inputBorder) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColorss.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColorss.inputBorder),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        counterText: "",
      ),
    );
  }
}

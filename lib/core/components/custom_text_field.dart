import 'package:flutter/material.dart';
import 'package:our_market_admin/core/app_colors.dart';

class CustomField extends StatelessWidget {
  const CustomField({super.key, this.controller, required this.labelText});
  final String labelText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.kBordersideColor,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: AppColors.kBlackColor),
        border: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.kBordersideColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.kBordersideColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.kBordersideColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

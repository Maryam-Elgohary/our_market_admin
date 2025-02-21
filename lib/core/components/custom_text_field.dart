import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:our_market_admin/core/app_colors.dart';

class CustomField extends StatelessWidget {
  const CustomField(
      {super.key,
      this.controller,
      required this.labelText,
      this.isPassword = false,
      this.onPressed,
      this.onChanged,
      this.inputFormatters});
  final String labelText;
  final TextEditingController? controller;
  final bool isPassword;
  final void Function()? onPressed;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      validator: (Value) {
        if (Value!.isEmpty) {
          return "This field can't be empty";
        }
        return null;
      },
      obscureText: isPassword,
      cursorColor: AppColors.kBordersideColor,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword
            ? IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.remove_red_eye_outlined))
            : null,
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

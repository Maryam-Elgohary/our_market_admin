import 'package:flutter/material.dart';
import 'package:our_market_admin/core/app_colors.dart';

AppBar buildCustomAppBar(BuildContext context, String title,
    {bool isBackButton = true}) {
  return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(color: AppColors.kWhiteColor),
      ),
      backgroundColor: AppColors.kPrimaryColor,
      leading: isBackButton
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.kWhiteColor,
              ),
            )
          : Container());
}

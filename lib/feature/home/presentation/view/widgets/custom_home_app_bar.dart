import 'package:ahmed_task/Core/themes/app_color.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.borderColor, width: 1),
      ),
      backgroundColor: AppColors.white,
      elevation: 0,
      surfaceTintColor: AppColors.white,
      title: const Text('Home Feed', style: AppTextStyle.heading2),
      centerTitle: true,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary.withValues(alpha: 0.1),
        ),
        child: IconButton(
          icon: const Icon(Icons.camera_alt_outlined),
          color: AppColors.primary,
          onPressed: () {
            // TODO: Open camera
          },
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          color: AppColors.darkText,
          onPressed: () {
            // TODO: Open search
          },
        ),
      ],
    );
  }
}

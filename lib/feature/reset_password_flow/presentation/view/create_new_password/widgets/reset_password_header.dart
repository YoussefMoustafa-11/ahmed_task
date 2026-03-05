import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/themes/app_color.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';

/// Header section with title and description
class ResetPasswordHeader extends StatelessWidget {
  const ResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create New Password',
          style: TextStyle(
            fontSize: 24,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Your new password must be different from previous passwords.',
          style: AppTextStyle.bodyMedium.copyWith(
            fontSize: 14,
            color: AppColors.greyText,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

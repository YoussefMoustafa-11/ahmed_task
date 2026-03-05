import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/widgets/custom_button.dart';
import 'package:ahmed_task/Core/themes/app_color.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';

/// Footer section with reset password button and support link
class ResetPasswordFooter extends StatelessWidget {
  final VoidCallback onResetPressed;
  final VoidCallback? onContactSupportPressed;
  const ResetPasswordFooter({
    super.key,
    required this.onResetPressed,
    this.onContactSupportPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          onPressed: onResetPressed,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          buttonText: 'Reset Password',
          width: double.infinity,
          height: 56,
          borderRadius: 12,
          elevation: 4,
          shadowColor: AppColors.primary.withOpacity(0.2),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Need help? ',
              style: AppTextStyle.labelMedium.copyWith(
                fontSize: 13,
                color: AppColors.greyText,
                fontWeight: FontWeight.w400,
              ),
            ),
            GestureDetector(
              onTap: onContactSupportPressed,
              child: Text(
                'Contact Support',
                style: AppTextStyle.labelMedium.copyWith(
                  fontSize: 13,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

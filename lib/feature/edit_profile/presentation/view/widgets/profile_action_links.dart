import 'package:flutter/material.dart';
import '../../../../../Core/themes/app_text_style.dart';
import '../../../../../Core/themes/app_color.dart';

class ProfileActionLinks extends StatelessWidget {
  final VoidCallback onChangePassword;
  final VoidCallback onSwitchProfessional;

  const ProfileActionLinks({
    super.key,
    required this.onChangePassword,
    required this.onSwitchProfessional,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        GestureDetector(
          onTap: onChangePassword,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock_reset, color: Color(0xFF2F80ED), size: 16),
              const SizedBox(width: 8),
              Text(
                'Change Password',
                style: AppTextStyle.labelMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Divider(color: const Color(0xFFE2E8F0), height: 1),
        ),
        const SizedBox(height: 32),
        GestureDetector(
          onTap: onSwitchProfessional,
          child: Text(
            'Switch to Professional Account',
            style: AppTextStyle.labelMedium.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

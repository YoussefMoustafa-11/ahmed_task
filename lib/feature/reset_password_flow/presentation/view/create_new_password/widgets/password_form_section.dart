import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/widgets/custom_text_field.dart';

/// Password input form section with new password and confirm password fields
class PasswordFormSection extends StatelessWidget {
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;

  const PasswordFormSection({
    super.key,
    required this.newPasswordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: newPasswordController,
          isPassword: true,
          label: 'New Password',
          hintText: 'Enter your new password',
        ),
        const SizedBox(height: 24),
        CustomTextField(
          controller: confirmPasswordController,
          isPassword: true,
          label: 'Confirm Password',
          hintText: 'Re-enter your new password',
        ),
      ],
    );
  }
}

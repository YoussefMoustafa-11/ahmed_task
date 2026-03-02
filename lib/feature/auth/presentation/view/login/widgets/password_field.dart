
import 'package:ahmed_task/Core/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Password', style: AppTextStyle.labelMedium),
        GestureDetector(
          onTap: () {
            // TODO: Navigate to forgot password
          },
          child: const Text('Forgot password?', style: AppTextStyle.linkText),
        ),
      ],
    );
  }
}


import 'package:ahmed_task/Core/routing/app_routes.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            GoRouter.of(context).pushNamed(AppRoutes.forgotPasswordView);
          },
          child: const Text('Forgot password?', style: AppTextStyle.linkText),
        ),
      ],
    );
  }
}

import 'package:ahmed_task/feature/auth/presentation/view/widgets/social_button.dart';
import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SocialButton(
            onPressed: () {
              // TODO: Implement Google sign in
            },
            icon: Icons.g_mobiledata,
            label: 'Google',
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: SocialButton(
            onPressed: () {
              // TODO: Implement Apple sign in
            },
            icon: Icons.apple,
            label: 'Apple',
          ),
        ),
      ],
    );
  }
}

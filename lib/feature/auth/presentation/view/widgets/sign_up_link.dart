import 'package:ahmed_task/Core/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class SignUpLink extends StatelessWidget {
  final String text;
  final String linkText;
  final VoidCallback onTap;

  const SignUpLink({
    super.key,
    required this.text,
    required this.linkText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: RichText(
          text: TextSpan(
            style: AppTextStyle.bodyMedium,
            children: [
              TextSpan(text: text),
              TextSpan(
                text: linkText,
                style: AppTextStyle.linkText.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

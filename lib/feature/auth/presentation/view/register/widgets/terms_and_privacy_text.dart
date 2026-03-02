import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndPrivacyText extends StatelessWidget {
  final VoidCallback onTermsTap;
  final VoidCallback onPrivacyTap;

  const TermsAndPrivacyText({
    super.key,
    required this.onTermsTap,
    required this.onPrivacyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(color: Colors.grey[700], fontSize: 14),
          children: [
            const TextSpan(text: "By clicking Register, you agree to our "),
            TextSpan(
              text: "Terms of Service",
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTermsTap,
            ),
            const TextSpan(text: " and "),
            TextSpan(
              text: "Privacy Policy",
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
              recognizer: TapGestureRecognizer()..onTap = onPrivacyTap,
            ),
            const TextSpan(text: "."),
          ],
        ),
      ),
    );
  }
}

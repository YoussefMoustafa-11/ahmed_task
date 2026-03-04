import 'package:flutter/material.dart';

class BackToLoginLink extends StatelessWidget {
  final VoidCallback onTap;

  const BackToLoginLink({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.arrow_back, size: 14, color: const Color(0xFF2b8cee)),
          const SizedBox(width: 4),
          Text(
            'Back to Login',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: const Color(0xFF2b8cee),
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationThickness: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Tagline extends StatelessWidget {
  const Tagline({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Create. Share. Inspire.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        color: Color(0xFF64748B),
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Connect',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w700,
        color: Colors.black,
        letterSpacing: 1.05,
      ),
    );
  }
}

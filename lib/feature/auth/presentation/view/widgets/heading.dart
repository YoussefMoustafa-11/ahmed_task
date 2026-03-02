import 'package:ahmed_task/Core/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String subtitle;
  
  final String title;

  const Heading({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
           Text(
            title,
            style: AppTextStyle.heading1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          // Subtitle
           Text(
            subtitle,
            style: AppTextStyle.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

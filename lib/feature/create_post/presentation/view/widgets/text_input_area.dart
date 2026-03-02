import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';

class TextInputArea extends StatelessWidget {
  final TextEditingController controller;

  const TextInputArea({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: TextField(
        controller: controller,
        maxLines: null,
        minLines: 8,
        style: AppTextStyle.bodyMedium.copyWith(fontSize: 16, height: 1.5),
        decoration: InputDecoration(
          hintText: "What's happening? Share your thoughts...",
          hintStyle: AppTextStyle.bodyMedium.copyWith(
            fontSize: 16,
            color: Colors.grey[400],
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}

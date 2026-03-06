import 'package:ahmed_task/Core/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class StoryReplyInput extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final VoidCallback? onEmojiPressed;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  const StoryReplyInput({
    super.key,
    required this.controller,
    this.hintText = 'Send a message...',
    this.onEmojiPressed,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  State<StoryReplyInput> createState() => _StoryReplyInputState();
}

class _StoryReplyInputState extends State<StoryReplyInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
        color: Colors.black.withOpacity(0.2),
      ),
      child: Row(
        children: [
          // Text Input
          Expanded(
            child: TextField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              textInputAction: TextInputAction.send,
              style: AppTextStyle.inputText.copyWith(
                color: Colors.white,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: AppTextStyle.inputHint.copyWith(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 14,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          // Emoji Button
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: widget.onEmojiPressed,
              icon: const Icon(
                Icons.sentiment_satisfied_alt,
                color: Colors.white,
                size: 20,
              ),
              padding: const EdgeInsets.all(8),
              constraints: const BoxConstraints(),
            ),
          ),
        ],
      ),
    );
  }
}

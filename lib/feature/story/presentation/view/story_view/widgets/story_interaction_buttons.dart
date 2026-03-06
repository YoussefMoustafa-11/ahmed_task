import 'package:flutter/material.dart';

class StoryInteractionButtons extends StatelessWidget {
  final VoidCallback? onLikePressed;
  final VoidCallback? onSendPressed;
  final bool isLiked;

  const StoryInteractionButtons({
    super.key,
    this.onLikePressed,
    this.onSendPressed,
    this.isLiked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Like Button
        IconButton(
          onPressed: onLikePressed,
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_outline,
            color: isLiked ? Colors.red : Colors.white,
            size: 28,
          ),
          constraints: const BoxConstraints(),
          padding: const EdgeInsets.all(8),
        ),
        const SizedBox(width: 16),
        // Send Button
        IconButton(
          onPressed: onSendPressed,
          icon: const Icon(Icons.send, color: Colors.white, size: 28),
          constraints: const BoxConstraints(),
          padding: const EdgeInsets.all(8),
        ),
      ],
    );
  }
}

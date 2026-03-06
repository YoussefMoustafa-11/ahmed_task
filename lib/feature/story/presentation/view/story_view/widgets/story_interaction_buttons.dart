import 'package:flutter/material.dart';

class StoryInteractionButtons extends StatefulWidget {
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
  State<StoryInteractionButtons> createState() =>
      _StoryInteractionButtonsState();
}

class _StoryInteractionButtonsState extends State<StoryInteractionButtons> {
  late bool _isLiked;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Like Button
        IconButton(
          onPressed: () {
            setState(() {
              _isLiked = !_isLiked;
            });
            widget.onLikePressed?.call();
          },
          icon: Icon(
            _isLiked ? Icons.favorite : Icons.favorite_outline,
            color: _isLiked ? Colors.red : Colors.white,
            size: 28,
          ),
          constraints: const BoxConstraints(),
          padding: const EdgeInsets.all(8),
        ),
        const SizedBox(width: 16),
        // Send Button
        IconButton(
          onPressed: widget.onSendPressed,
          icon: const Icon(Icons.send, color: Colors.white, size: 28),
          constraints: const BoxConstraints(),
          padding: const EdgeInsets.all(8),
        ),
      ],
    );
  }
}

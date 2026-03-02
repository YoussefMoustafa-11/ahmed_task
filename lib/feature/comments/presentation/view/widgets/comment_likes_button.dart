import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/themes/app_color.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';

class CommentLikesButton extends StatefulWidget {
  final int initialLikes;
  final bool isLiked;
  final VoidCallback? onLikeToggle;

  const CommentLikesButton({
    super.key,
    required this.initialLikes,
    this.isLiked = false,
    this.onLikeToggle,
  });

  @override
  State<CommentLikesButton> createState() => _CommentLikesButtonState();
}

class _CommentLikesButtonState extends State<CommentLikesButton> {
  late bool _isLiked;
  late int _likeCount;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
    _likeCount = widget.initialLikes;
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _likeCount = _isLiked ? _likeCount + 1 : _likeCount - 1;
    });
    widget.onLikeToggle?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleLike,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: _isLiked
              ? AppColors.primary.withValues(alpha: 0.1)
              : Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border,
              size: 14,
              color: _isLiked ? AppColors.primary : Colors.grey[400],
            ),
            const SizedBox(width: 6),
            Text(
              _likeCount.toString(),
              style: AppTextStyle.bodyMedium.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: _isLiked ? AppColors.primary : Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

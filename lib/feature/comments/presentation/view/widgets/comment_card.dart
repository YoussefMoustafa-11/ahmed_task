import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';
import 'package:ahmed_task/feature/comments/presentation/view/widgets/user_avatar.dart';
import 'package:ahmed_task/feature/comments/presentation/view/widgets/comment_likes_button.dart';

class CommentCard extends StatelessWidget {
  final String name;
  final String time;
  final String avatar;
  final String text;
  final int likes;
  final bool isLiked;

  const CommentCard({
    super.key,
    required this.name,
    required this.time,
    required this.avatar,
    required this.text,
    required this.likes,
    this.isLiked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!, width: 0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAvatar(imageUrl: avatar, size: 40),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: AppTextStyle.labelMedium.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '• $time',
                      style: AppTextStyle.bodyMedium.copyWith(
                        fontSize: 11,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  text,
                  style: AppTextStyle.bodyMedium.copyWith(
                    fontSize: 13,
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: CommentLikesButton(
                    initialLikes: likes,
                    isLiked: isLiked,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

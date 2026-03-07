import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/themes/app_color.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';
import 'package:ahmed_task/Core/widgets/user_avatar.dart';

class BottomSheetCommentCard extends StatelessWidget {
  final String name;
  final String time;
  final String avatar;
  final String text;
  final int likes;
  final bool isLiked;
  final List<Map<String, dynamic>>? replies;
  final int moreRepliesCount;

  const BottomSheetCommentCard({
    super.key,
    required this.name,
    required this.time,
    required this.avatar,
    required this.text,
    required this.likes,
    this.isLiked = false,
    this.replies,
    this.moreRepliesCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main comment card
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[100]!.withValues(alpha: 0.5)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 4,
                offset: const Offset(0, 1),
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
                    // Name + time + likes
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                name,
                                style: AppTextStyle.labelMedium.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.darkText,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                time,
                                style: AppTextStyle.bodyMedium.copyWith(
                                  fontSize: 11,
                                  color: AppColors.greyText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        _LikeIndicator(likes: likes, isLiked: isLiked),
                      ],
                    ),
                    const SizedBox(height: 4),
                    // Comment text
                    Text(
                      text,
                      style: AppTextStyle.bodyMedium.copyWith(
                        fontSize: 14,
                        color: const Color(0xFF475569),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Reply button
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Reply',
                        style: AppTextStyle.labelMedium.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF64748B),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Replies
        if (replies != null && replies!.isNotEmpty) ...[
          const SizedBox(height: 12),
          for (final reply in replies!)
            _ReplyCard(
              name: reply['name'] as String,
              time: reply['time'] as String,
              avatar: reply['avatar'] as String,
              text: reply['text'] as String,
              mentionName: reply['mentionName'] as String?,
              likes: reply['likes'] as int? ?? 0,
              isLiked: reply['isLiked'] as bool? ?? false,
            ),
        ],

        // "View more replies" button
        if (moreRepliesCount > 0) ...[
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 24, height: 1, color: Colors.grey[200]),
                  const SizedBox(width: 8),
                  Text(
                    'View $moreRepliesCount more replies',
                    style: AppTextStyle.labelMedium.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

/// Nested reply card (smaller, indented)
class _ReplyCard extends StatelessWidget {
  final String name;
  final String time;
  final String avatar;
  final String text;
  final String? mentionName;
  final int likes;
  final bool isLiked;

  const _ReplyCard({
    required this.name,
    required this.time,
    required this.avatar,
    required this.text,
    this.mentionName,
    required this.likes,
    this.isLiked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC).withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[100]!),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAvatar(imageUrl: avatar, size: 32),
            const SizedBox(width: 10),
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
                          fontWeight: FontWeight.w700,
                          color: AppColors.darkText,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        time,
                        style: AppTextStyle.bodyMedium.copyWith(
                          fontSize: 10,
                          color: AppColors.greyText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text.rich(
                    TextSpan(
                      children: [
                        if (mentionName != null)
                          TextSpan(
                            text: '@$mentionName ',
                            style: AppTextStyle.bodyMedium.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                              height: 1.5,
                            ),
                          ),
                        TextSpan(
                          text: text,
                          style: AppTextStyle.bodyMedium.copyWith(
                            fontSize: 13,
                            color: const Color(0xFF64748B),
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Reply',
                          style: AppTextStyle.labelMedium.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: const Color(
                              0xFF64748B,
                            ).withValues(alpha: 0.7),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      _LikeIndicator(
                        likes: likes,
                        isLiked: isLiked,
                        small: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Compact like icon + count
class _LikeIndicator extends StatelessWidget {
  final int likes;
  final bool isLiked;
  final bool small;

  const _LikeIndicator({
    required this.likes,
    this.isLiked = false,
    this.small = false,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = small ? 14.0 : 16.0;
    final fontSize = small ? 10.0 : 12.0;
    final color = isLiked ? AppColors.primary : AppColors.greyText;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isLiked ? Icons.favorite : Icons.favorite_border,
          size: iconSize,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(
          '$likes',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: isLiked ? FontWeight.w700 : FontWeight.w400,
            color: color,
          ),
        ),
      ],
    );
  }
}

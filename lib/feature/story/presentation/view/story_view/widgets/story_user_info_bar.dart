import 'package:ahmed_task/Core/themes/app_color.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class StoryUserInfoBar extends StatelessWidget {
  final String username;
  final String timestamp;
  final String profileImageUrl;
  final VoidCallback? onMorePressed;
  final VoidCallback? onClosePressed;

  const StoryUserInfoBar({
    super.key,
    required this.username,
    required this.timestamp,
    required this.profileImageUrl,
    this.onMorePressed,
    this.onClosePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // User Profile Section
          Expanded(
            child: Row(
              children: [
                // Profile Picture
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 2),
                    image: DecorationImage(
                      image: NetworkImage(profileImageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Username and Timestamp
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        username,
                        style: AppTextStyle.labelMedium.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        timestamp,
                        style: AppTextStyle.bodyMedium.copyWith(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Action Buttons
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: onMorePressed,
                icon: const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 24,
                ),
                padding: const EdgeInsets.all(8),
                constraints: const BoxConstraints(),
              ),
              IconButton(
                onPressed: onClosePressed,
                icon: const Icon(Icons.close, color: Colors.white, size: 24),
                padding: const EdgeInsets.all(8),
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

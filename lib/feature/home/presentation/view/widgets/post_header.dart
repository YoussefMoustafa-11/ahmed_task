import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/themes/app_color.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';
import 'package:ahmed_task/feature/home/presentation/view/widgets/post_card.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key, required this.widget});

  final PostCard widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: widget.userImage.isNotEmpty
                ? NetworkImage(widget.userImage)
                : null,
            child: widget.userImage.isEmpty
                ? const Icon(Icons.person, size: 18, color: AppColors.greyText)
                : null,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.username,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.labelMedium.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      widget.timeAgo,
                      style: AppTextStyle.bodyMedium.copyWith(
                        fontSize: 11,
                        color: AppColors.greyText,
                      ),
                    ),
                    const Text(
                      ' • ',
                      style: TextStyle(color: AppColors.greyText, fontSize: 11),
                    ),
                    Expanded(
                      child: Text(
                        widget.location,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.bodyMedium.copyWith(
                          fontSize: 11,
                          color: AppColors.greyText,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 28,
            height: 28,
            child: IconButton(
              padding: const EdgeInsets.all(0),
              icon: const Icon(
                Icons.more_horiz,
                size: 20,
                color: AppColors.greyText,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

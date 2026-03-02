import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/themes/app_color.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';

class CommentsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String postTitle;
  final String totalComments;

  const CommentsAppBar({
    super.key,
    required this.postTitle,
    required this.totalComments,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, size: 20),
        color: AppColors.darkText,
        onPressed: () => Navigator.pop(context),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            postTitle,
            style: AppTextStyle.labelMedium.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            totalComments,
            style: AppTextStyle.bodyMedium.copyWith(
              fontSize: 11,
              color: AppColors.greyText,
            ),
          ),
        ],
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.more_horiz, size: 20),
          color: AppColors.darkText,
          onPressed: () {},
        ),
      ],
    );
  }
}

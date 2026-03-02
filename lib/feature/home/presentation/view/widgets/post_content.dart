import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/themes/app_color.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';
import 'package:ahmed_task/feature/home/presentation/view/widgets/post_card.dart';

class PostContent extends StatelessWidget {
  const PostContent({super.key, required this.widget});

  final PostCard widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.content,
      style: AppTextStyle.bodyMedium.copyWith(
        fontSize: 13,
        color: AppColors.darkText,
        height: 1.4,
      ),
    );
  }
}

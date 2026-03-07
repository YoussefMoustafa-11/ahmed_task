import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/themes/app_color.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';

class CommentsBottomSheetHeader extends StatelessWidget {
  final int totalComments;

  const CommentsBottomSheetHeader({super.key, required this.totalComments});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 12),
        // Drag handle
        Container(
          width: 40,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(2.5),
          ),
        ),
        const SizedBox(height: 16),
        // Title row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const SizedBox(width: 40), // spacer to balance close button
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Comments',
                      style: AppTextStyle.labelMedium.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkText,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '$totalComments Total'.toUpperCase(),
                      style: AppTextStyle.bodyMedium.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.greyText,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: Material(
                  color: Colors.grey[100],
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                      size: 20,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey[200]!.withValues(alpha: 0.6),
        ),
      ],
    );
  }
}

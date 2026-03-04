import 'package:flutter/material.dart';
import '../../../../../Core/themes/app_text_style.dart';
import '../../../../../Core/themes/app_color.dart';

class EditProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onCancel;
  final VoidCallback onSave;

  const EditProfileAppBar({
    super.key,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white.withOpacity(0.8),
      elevation: 0,
      leadingWidth: 80,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(color: const Color(0xFFE2E8F0), height: 1),
      ),
      leading: GestureDetector(
        onTap: onCancel,
        child: Center(
          child: Text(
            'Cancel',
            style: AppTextStyle.labelMedium.copyWith(
              color: AppColors.greyText,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      title: Text(
        'Edit Profile',
        style: AppTextStyle.heading2.copyWith(fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: onSave,
            child: Center(
              child: Text(
                'Save',
                style: AppTextStyle.labelMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

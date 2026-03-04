import 'package:flutter/material.dart';
import '../../../../../Core/themes/app_text_style.dart';
import '../../../../../Core/themes/app_color.dart';

class ProfilePhotoSection extends StatelessWidget {
  final ImageProvider? imageProvider;
  final Future<void> Function() onChangePhoto;

  const ProfilePhotoSection({
    super.key,
    this.imageProvider,
    required this.onChangePhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        Center(
          child: GestureDetector(
            onTap: onChangePhoto,
            child: Stack(
              children: [
                Container(
                  width: 112,
                  height: 112,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    color: const Color(0xFFF1F5F9),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(56),
                    child: imageProvider != null
                        ? Image(image: imageProvider!, fit: BoxFit.cover)
                        : Icon(
                            Icons.image_search,
                            size: 64,
                            color: const Color(0xFF94A3B8),
                          ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: onChangePhoto,
          child: Text(
            'Change Profile Photo'.toUpperCase(),
            style: AppTextStyle.labelMedium.copyWith(
              fontSize: 12,
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

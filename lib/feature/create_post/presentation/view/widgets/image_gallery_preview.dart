import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';
import 'package:ahmed_task/feature/create_post/presentation/view/widgets/image_card.dart';
import 'package:ahmed_task/feature/create_post/presentation/view/widgets/add_more_image_button.dart';

class ImageGalleryPreview extends StatelessWidget {
  final List<String> images;
  final Function(int) onRemoveImage;

  const ImageGalleryPreview({
    super.key,
    required this.images,
    required this.onRemoveImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'PREVIEW',
                  style: AppTextStyle.labelMedium.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[500],
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  '${images.length} images selected',
                  style: AppTextStyle.labelMedium.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[600],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                ...List.generate(
                  images.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: index == images.length - 1 ? 0 : 12),
                    child: SizedBox(
                      width: 120,
                      child: ImageCard(
                        imageUrl: images[index],
                        onRemove: () => onRemoveImage(index),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 120,
                  child: AddMoreImageButton(onTap: () {}),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

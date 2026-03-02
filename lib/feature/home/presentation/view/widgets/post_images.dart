import 'package:flutter/material.dart';
import 'package:ahmed_task/feature/home/presentation/view/widgets/post_card.dart';

class PostImages extends StatefulWidget {
  const PostImages({super.key, required this.widget});

  final PostCard widget;

  @override
  State<PostImages> createState() => _PostImagesState();
}

class _PostImagesState extends State<PostImages> {
  @override
  Widget build(BuildContext context) {
    final imageCount = widget.widget.images.length;

    if (imageCount == 1) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.widget.images[0]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: 240,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageCount,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.widget.images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }
}

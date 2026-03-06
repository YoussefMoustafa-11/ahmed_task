import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/themes/app_color.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';
import 'package:ahmed_task/feature/home/presentation/view/widgets/post_header.dart';
import 'package:ahmed_task/feature/home/presentation/view/widgets/post_content.dart';
import 'package:ahmed_task/feature/home/presentation/view/widgets/post_images.dart';
import 'package:ahmed_task/feature/comments/presentation/view/comments_view.dart';

class PostCard extends StatefulWidget {
  final String userImage;
  final String username;
  final String timeAgo;
  final String location;
  final String content;
  final List<String> images;
  final int likesCount;
  final int commentsCount;
  final bool isLiked;

  const PostCard({
    super.key,
    required this.userImage,
    required this.username,
    required this.timeAgo,
    required this.location,
    required this.content,
    required this.images,
    required this.likesCount,
    required this.commentsCount,
    this.isLiked = false,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late bool _isLiked;
  late int _likesCount;
  bool _isBookmarked = false;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
    _likesCount = widget.likesCount;
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _likesCount = _isLiked ? _likesCount + 1 : _likesCount - 1;
    });
  }

  void _toggleBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
    });
  }

  String _formatCount(int count) {
    if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}k';
    }
    return count.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.borderColor, width: 1),
          bottom: BorderSide(color: AppColors.borderColor, width: 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Header
            PostHeader(widget: widget),
            const SizedBox(height: 8),

            // Post Content
            PostContent(widget: widget),
            const SizedBox(height: 10),

            // Post Images
            if (widget.images.isNotEmpty) PostImages(widget: widget),
            const SizedBox(height: 10),

            // Post Actions
            Row(
              children: [
                GestureDetector(
                  onTap: _toggleLike,
                  child: Row(
                    children: [
                      Icon(
                        _isLiked ? Icons.favorite : Icons.favorite_border,
                        color: _isLiked ? Colors.red : AppColors.greyText,
                        size: 24,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _formatCount(_likesCount),
                        style: AppTextStyle.bodyMedium.copyWith(
                          fontSize: 14,
                          color: AppColors.darkText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),

                // Comment Button
                GestureDetector(
                  onTap: () {
                    CommentsView.show(
                      context,
                      postTitle: widget.content,
                      commentsCount: widget.commentsCount,
                    );
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.chat_bubble_outline,
                        color: AppColors.greyText,
                        size: 24,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _formatCount(widget.commentsCount),
                        style: AppTextStyle.bodyMedium.copyWith(
                          fontSize: 14,
                          color: AppColors.darkText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),

                // Share Button
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.send_outlined,
                    color: AppColors.greyText,
                    size: 24,
                  ),
                ),
                const Spacer(),

                // Bookmark Button
                GestureDetector(
                  onTap: _toggleBookmark,
                  child: Icon(
                    _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: _isBookmarked
                        ? AppColors.primary
                        : AppColors.greyText,
                    size: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ahmed_task/feature/home/presentation/view/widgets/post_card.dart';

class PostsSection extends StatelessWidget {
  const PostsSection({super.key, required this.posts});

  final List<Map<String, dynamic>> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: PostCard(
            userImage: post['userImage'],
            username: post['username'],
            timeAgo: post['timeAgo'],
            location: post['location'],
            content: post['content'],
            images: List<String>.from(post['images']),
            likesCount: post['likesCount'],
            commentsCount: post['commentsCount'],
            isLiked: post['isLiked'],
          ),
        );
      },
    );
  }
}

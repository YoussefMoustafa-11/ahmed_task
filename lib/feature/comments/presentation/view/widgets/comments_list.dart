import 'package:flutter/material.dart';
import 'package:ahmed_task/feature/comments/presentation/view/widgets/comment_card.dart';

class CommentsList extends StatelessWidget {
  final List<Map<String, dynamic>> comments;

  const CommentsList({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: comments.length,
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: true,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final comment = comments[index];
        return RepaintBoundary(
          child: CommentCard(
            name: comment['name'],
            time: comment['time'],
            avatar: comment['avatar'],
            text: comment['text'],
            likes: comment['likes'],
            isLiked: comment['isLiked'],
          ),
        );
      },
    );
  }
}

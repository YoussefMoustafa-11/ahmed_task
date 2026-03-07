import 'package:flutter/material.dart';
import 'package:ahmed_task/feature/comments/presentation/view/widgets/comments_bottom_sheet_header.dart';
import 'package:ahmed_task/feature/comments/presentation/view/widgets/bottom_sheet_comment_card.dart';
import 'package:ahmed_task/feature/comments/presentation/view/widgets/comments_bottom_sheet_input_bar.dart';

/// Shows a modal bottom sheet styled to match the HTML comments design.
///
/// [comments] — list of comment maps with keys: name, time, avatar, text, likes, isLiked.
/// Optionally each comment can have 'replies' (list of reply maps) and 'moreRepliesCount'.
Future<void> showCommentsBottomSheet(
  BuildContext context, {
  required List<Map<String, dynamic>> comments,
  required int totalComments,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.4),
    builder: (context) =>
        CommentsBottomSheet(comments: comments, totalComments: totalComments),
  );
}

class CommentsBottomSheet extends StatelessWidget {
  final List<Map<String, dynamic>> comments;
  final int totalComments;

  const CommentsBottomSheet({
    super.key,
    required this.comments,
    required this.totalComments,
  });

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.94;

    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight),
      decoration: const BoxDecoration(
        color: Color(0xFFF6F7F8), // background-light from HTML
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40), // rounded-t-[2.5rem]
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          CommentsBottomSheetHeader(totalComments: totalComments),

          // Scrollable comment list
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              itemCount: comments.length,
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: true,
              separatorBuilder: (_, __) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                final c = comments[index];
                return RepaintBoundary(
                  child: BottomSheetCommentCard(
                    name: c['name'] as String,
                    time: c['time'] as String,
                    avatar: c['avatar'] as String,
                    text: c['text'] as String,
                    likes: c['likes'] as int,
                    isLiked: c['isLiked'] as bool? ?? false,
                    replies: (c['replies'] as List<Map<String, dynamic>>?) ?? [],
                    moreRepliesCount: c['moreRepliesCount'] as int? ?? 0,
                  ),
                );
              },
            ),
          ),

          // Input bar
          CommentsBottomSheetInputBar(
           
            onCancelReply: () {},
            onSubmit: (text) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Comment added: $text')));
            },
          ),
        ],
      ),
    );
  }
}

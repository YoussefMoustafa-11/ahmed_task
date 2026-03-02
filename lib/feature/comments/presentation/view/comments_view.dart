import 'package:flutter/material.dart';
import 'package:ahmed_task/feature/comments/presentation/view/widgets/comments_app_bar.dart';
import 'package:ahmed_task/feature/comments/presentation/view/widgets/comments_list.dart';
import 'package:ahmed_task/feature/comments/presentation/view/widgets/comments_input_bar.dart';

class CommentsView extends StatefulWidget {
  const CommentsView({super.key, required this.postTitle, required this.commentsCount});
     final String postTitle;
     final int commentsCount;
  @override
  State<CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  final List<Map<String, dynamic>> comments = [
    {
      'name': 'Alex Johnson',
      'time': '2h ago',
      'avatar':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAz3vthvswf3sqcM468bMOS3y0SY4eWZxtLYTRlCe_9Lo9jg718BrNOVK6H3O5DDMuXvkbeYNWTAT7s83B0dPoOpuEARuKho5FSybPjRO-omDmqIywzW4JkUgP4lw7cRzBgqjz81Omi9pqFAXt6KiHeArBY1RRlpuPzdrv-f40XGYV19CE2SMUqMAm1ZLNavtyN_wjjEFkaf5Ty3Ur-icDbZD_jW07ylVWHBVXpgwCWWCJAx_t45qbZ_efKmUkCshwnrBx9sQ_U4v8',
      'text':
          'This looks amazing! Love the color palette you used here. It really makes the content pop against the neutral background.',
      'likes': 12,
      'isLiked': true,
    },
    {
      'name': 'Maria Garcia',
      'time': '1h ago',
      'avatar':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDAw9RB6rBkdHhR3NcNnNswarOcDArodP7vvlaz2GuaO26n3y71IEjE1voSsCBg1c7BHzAO2j4UijbJ0bfSKmYpTBqpDGOCmySEL8fXqLlvxnusZGs63agQqmrn4kfNdm0qMuaxJoqvJMQ6FSdUFJBs_6W98Bo6pk5BFDJY9h-ElFJvHE0e15Im_Z8O8dTvP-IxWG1MAsX7qL14fJh9Brh1KRmPFrN-a-xbCvrXTmm5RS70tJZtrJ-hEQ8c-slaGMeTo0U_VRwkDw4',
      'text':
          'Great post, very inspiring. Looking forward to more content like this!',
      'likes': 5,
      'isLiked': false,
    },
    {
      'name': 'Jordan Smith',
      'time': '45m ago',
      'avatar':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCFbJRuS29HDyphMdf0T0u1PHc51P0L44LR3iscE9wm6gulRToCvWAgWZajS_p62UdFQLBMgE97cKq6I5td2cF-B9xcaitcOOjjRFh0A_Gerx3fQ4gQnmKYmdZvCnzAWiJ_jxDoO6zgGuxZQ49yLtThzxemPrpRucgWBs4TwxtocRzlEKoK4DJwFMXK5XOKK0a4fFUN0YBpfwRkQFFs2aDgsuaez2uOxHDxx1ihoU2KfipvKLspS0ZWT-tWio1EsJikeFVnCDdYEbI',
      'text':
          'Could you share which tools you used for this? I\'m trying to improve my workflow and this looks like a great standard to aim for.',
      'likes': 2,
      'isLiked': false,
    },
    {
      'name': 'Sam Wilson',
      'time': '10m ago',
      'avatar':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuD8Ij_kkZ9tU44fmdThrEn5juuwl4Cg8H9G-ZG5oIl2CazIZG5-p4y3vtzd9WbiP_u-eNVBBANqcAUhg6Esq-wLq2Nj8u-ctw8b28xQVH8bN6194P0DiHZTU7Ir_Bl1OElgJolH9FCb3JuYPtHc1ilEBW1CCnitJJfLfZNkQUFvHtqrDb3KnzCb_T1s0IQBrgIvJn4y6s-gA8CdATsFNWzph_12L_MC19QLKXOleCvin4HVyfuLBCEA6SOs8ZkrBexD4lUBj2LJqGU',
      'text':
          'Absolutely brilliant work. The attention to detail is noticeable.',
      'likes': 8,
      'isLiked': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: CommentsAppBar(
        postTitle: widget.postTitle,
        totalComments: '${widget.commentsCount} Comments',
      ),
      body: CommentsList(comments: comments),
      bottomNavigationBar: CommentsInputBar(
        onSubmit: (text) {
          if (text.isNotEmpty) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Comment added: $text')));
          }
        },
      ),
    );
  }
}

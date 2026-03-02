import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/themes/app_color.dart';

class CommentsInputBar extends StatefulWidget {
  final Function(String) onSubmit;

  const CommentsInputBar({
    super.key,
    required this.onSubmit,
  });

  @override
  State<CommentsInputBar> createState() => _CommentsInputBarState();
}

class _CommentsInputBarState extends State<CommentsInputBar> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {
        _hasText = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submitComment() {
    if (_controller.text.isNotEmpty) {
      widget.onSubmit(_controller.text);
      _controller.clear();
      setState(() => _hasText = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: 12 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withOpacity(0.1),
                ),
                child: Icon(
                  Icons.person,
                  size: 20,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Add a comment...',
                    hintStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[400],
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    suffixIcon: _hasText
                        ? Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: GestureDetector(
                              onTap: _submitComment,
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary,
                                ),
                                child: const Icon(
                                  Icons.send,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : null,
                  ),
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => _submitComment(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 32,
            height: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

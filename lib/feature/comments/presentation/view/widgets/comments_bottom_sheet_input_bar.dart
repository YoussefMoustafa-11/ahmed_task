import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/themes/app_color.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';

class CommentsBottomSheetInputBar extends StatefulWidget {
  final String? replyingToName;
  final VoidCallback? onCancelReply;
  final ValueChanged<String> onSubmit;

  const CommentsBottomSheetInputBar({
    super.key,
    this.replyingToName,
    this.onCancelReply,
    required this.onSubmit,
  });

  @override
  State<CommentsBottomSheetInputBar> createState() =>
      _CommentsBottomSheetInputBarState();
}

class _CommentsBottomSheetInputBarState
    extends State<CommentsBottomSheetInputBar> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onSubmit(text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
      ),
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: bottomPadding > 0 ? bottomPadding + 8 : 32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // "Replying to" bar
          if (widget.replyingToName != null) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 12, left: 4, right: 4),
              child: Row(
                children: [
                  Row(
                    children: [
                      Text(
                        'Replying to',
                        style: AppTextStyle.bodyMedium.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.greyText,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '@${widget.replyingToName}',
                          style: AppTextStyle.labelMedium.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: widget.onCancelReply,
                    child: Icon(
                      Icons.close,
                      size: 16,
                      color: AppColors.greyText,
                    ),
                  ),
                ],
              ),
            ),
          ],

          // Input row
          Row(
            children: [
              // Current user avatar placeholder
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Icon(Icons.person, size: 20, color: AppColors.greyText),
              ),
              const SizedBox(width: 12),
              // Text field
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          style: AppTextStyle.inputText.copyWith(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: widget.replyingToName != null
                                ? 'Write a reply...'
                                : 'Write a comment...',
                            hintStyle: AppTextStyle.inputHint.copyWith(
                              fontSize: 14,
                              color: AppColors.greyText,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 14,
                            ),
                          ),
                          textInputAction: TextInputAction.send,
                          onSubmitted: (_) => _submit(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: GestureDetector(
                          onTap: _submit,
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.2,
                                  ),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.send,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Bottom home indicator bar
          const SizedBox(height: 16),
          Container(
            width: 128,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300]!.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}

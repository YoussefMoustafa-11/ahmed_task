import 'package:flutter/material.dart';
import 'widgets/story_progress_bar.dart';
import 'widgets/story_user_info_bar.dart';
import 'widgets/story_reply_input.dart';
import 'widgets/story_interaction_buttons.dart';

class StoryModel {
  final String videoUrl;
  final String username;
  final String timestamp;
  final String profileImageUrl;
  final int storyCount;
  final int currentStoryIndex;
  StoryModel({
    required this.videoUrl,
    required this.username,
    required this.timestamp,
    required this.profileImageUrl,
    required this.storyCount,
    required this.currentStoryIndex,
  });
}

class StoryView extends StatefulWidget {
  final StoryModel storyModel;
  final int storyCount;
  final int currentStoryIndex;

  const StoryView({
    super.key,
    required this.storyModel,
    this.storyCount = 3,
    this.currentStoryIndex = 0,
  });

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  late TextEditingController _replyController;
  late List<double> _progressValues;
  late int _currentProgress;
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _replyController = TextEditingController();
    _progressValues = List.generate(
      widget.storyCount,
      (index) => index < widget.currentStoryIndex
          ? 1.0
          : index == widget.currentStoryIndex
          ? 0.5
          : 0.0,
    );
    _currentProgress = widget.currentStoryIndex;
  }

  @override
  void dispose() {
    _replyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            // Video Background Layer
            Positioned.fill(
              child: Image.network(
                widget.storyModel.videoUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[800],
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.white54,
                        size: 48,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Content Overlay
            Positioned.fill(
              child: Column(
                children: [
                  // Top Section: Progress & User Info
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 48,
                      left: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    child: Column(
                      children: [
                        // Progress Bars
                        StoryProgressBar(
                          progress: _progressValues,
                          currentIndex: _currentProgress,
                        ),
                        const SizedBox(height: 12),
                        // User Info Bar
                        StoryUserInfoBar(
                          username: widget.storyModel.username,
                          timestamp: widget.storyModel.timestamp,
                          profileImageUrl: widget.storyModel.profileImageUrl,
                          onMorePressed: () {},
                          onClosePressed: () {
                            // Handle close
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  // Spacer
                  Expanded(
                    child: GestureDetector(
                      onTapDown: (details) {
                        // Handle next/previous story
                        final tapPosition = details.globalPosition.dx;
                        final screenWidth = MediaQuery.of(context).size.width;
                        if (tapPosition < screenWidth / 2) {
                          // Previous story
                        } else {
                          // Next story
                        }
                      },
                    ),
                  ),
                  // Bottom Section: Reply Input & Interaction Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ).copyWith(bottom: 40),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // Reply Input
                            Expanded(
                              child: StoryReplyInput(
                                controller: _replyController,
                                onEmojiPressed: () {},
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Interaction Buttons
                            StoryInteractionButtons(
                              isLiked: _isLiked,
                              onLikePressed: () {
                                setState(() {
                                  _isLiked = !_isLiked;
                                });
                              },
                              onSendPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

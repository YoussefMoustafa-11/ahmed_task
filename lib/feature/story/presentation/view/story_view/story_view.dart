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

class _StoryViewState extends State<StoryView>
    with SingleTickerProviderStateMixin {
  late TextEditingController _replyController;
  late AnimationController _progressController;
  late int _currentStoryIndex;
  bool _isLiked = false;

  static const _storyDuration = Duration(seconds: 5);

  @override
  void initState() {
    super.initState();
    _replyController = TextEditingController();
    _currentStoryIndex = widget.currentStoryIndex;

    _progressController = AnimationController(
      vsync: this,
      duration: _storyDuration,
    )..addStatusListener(_onProgressComplete);

    _progressController.forward();
  }

  void _onProgressComplete(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _goToNextStory();
    }
  }

  @override
  void dispose() {
    _replyController.dispose();
    _progressController.removeStatusListener(_onProgressComplete);
    _progressController.dispose();
    super.dispose();
  }

  void _goToNextStory() {
    if (_currentStoryIndex < widget.storyCount - 1) {
      setState(() => _currentStoryIndex++);
      _progressController.forward(from: 0);
    } else {
      if (mounted) Navigator.pop(context);
    }
  }

  void _goToPreviousStory() {
    if (_currentStoryIndex > 0) {
      setState(() => _currentStoryIndex--);
    }
    _progressController.forward(from: 0);
  }

  void _pauseStory() {
    _progressController.stop();
  }

  void _resumeStory() {
    if (mounted) _progressController.forward();
  }

  void _onTapStory(TapUpDetails details) {
    final tapX = details.globalPosition.dx;
    final screenWidth = MediaQuery.of(context).size.width;
    if (tapX < screenWidth / 3) {
      _goToPreviousStory();
    } else {
      _goToNextStory();
    }
  }

  void _onSendReply() {
    final text = _replyController.text.trim();
    if (text.isEmpty) return;
    _replyController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Reply sent: $text'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _onMorePressed() {
    _pauseStory();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.volume_off, color: Colors.white),
              title: const Text('Mute', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(sheetContext);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Story muted'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.report_outlined, color: Colors.white),
              title: const Text(
                'Report',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(sheetContext);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Story reported'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.share, color: Colors.white),
              title: const Text('Share', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(sheetContext);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Share link copied'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ).whenComplete(() => _resumeStory());
  }

  void _onEmojiPressed() {
    _pauseStory();
    final emojis = ['❤️', '😂', '😮', '😢', '👏', '🔥', '🎉', '😍'];
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: emojis.map((emoji) {
              return GestureDetector(
                onTap: () {
                  Navigator.pop(sheetContext);
                  _replyController.text += emoji;
                  _replyController.selection = TextSelection.fromPosition(
                    TextPosition(offset: _replyController.text.length),
                  );
                },
                child: Text(emoji, style: const TextStyle(fontSize: 32)),
              );
            }).toList(),
          ),
        ),
      ),
    ).whenComplete(() => _resumeStory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            // Image Background
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
                        // Animated Progress Bars
                        AnimatedBuilder(
                          animation: _progressController,
                          builder: (context, child) {
                            return StoryProgressBar(
                              progress: List.generate(
                                widget.storyCount,
                                (index) => index < _currentStoryIndex
                                    ? 1.0
                                    : index == _currentStoryIndex
                                    ? _progressController.value
                                    : 0.0,
                              ),
                              currentIndex: _currentStoryIndex,
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        // User Info Bar
                        StoryUserInfoBar(
                          username: widget.storyModel.username,
                          timestamp: widget.storyModel.timestamp,
                          profileImageUrl: widget.storyModel.profileImageUrl,
                          onMorePressed: _onMorePressed,
                          onClosePressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                  // Tap & Hold area for story navigation
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTapUp: _onTapStory,
                      onLongPressStart: (_) => _pauseStory(),
                      onLongPressEnd: (_) => _resumeStory(),
                    ),
                  ),
                  // Bottom Section: Reply Input & Interaction Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ).copyWith(bottom: 40),
                    child: Row(
                      children: [
                        // Reply Input
                        Expanded(
                          child: StoryReplyInput(
                            controller: _replyController,
                            onEmojiPressed: _onEmojiPressed,
                            onSubmitted: (_) => _onSendReply(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Interaction Buttons
                        StoryInteractionButtons(
                          isLiked: _isLiked,
                          onLikePressed: () {
                            setState(() => _isLiked = !_isLiked);
                          },
                          onSendPressed: _onSendReply,
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

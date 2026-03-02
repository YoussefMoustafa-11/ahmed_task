import 'package:flutter/material.dart';

import 'package:ahmed_task/feature/home/presentation/view/widgets/story_item.dart';

class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key, required this.stories});

  final List<Map<String, dynamic>> stories;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8FAFC),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: stories.length,
          itemBuilder: (context, index) {
            final story = stories[index];
            return StoryItem(
              imageUrl: story['imageUrl'],
              username: story['username'],
              isAddStory: story['isAddStory'],
              hasStory: story['hasStory'],
            );
          },
        ),
      ),
    );
  }
}

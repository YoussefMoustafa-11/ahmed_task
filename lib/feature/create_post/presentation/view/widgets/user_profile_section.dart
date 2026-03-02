import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';

class UserProfileSection extends StatefulWidget {
  const UserProfileSection({super.key});

  @override
  State<UserProfileSection> createState() => _UserProfileSectionState();
}

class _UserProfileSectionState extends State<UserProfileSection> {
  String _privacyLevel = 'Public';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuD53h5gAOdGPbEMO5IsbYJMbmP-yOULCt9kn5OM_A9umGs4HYj_xo3UlJBKtzQHbEq51XKA9pNEJKExAnxqDOQJI7x5J7mPMMbfKHl5C_pum0Q4L8K9OIVKPKFUD4l63VJrZ6PV5tmQcXbmR72fHZkQlY1mbI9CEiRfAsmo9ZQFYfv3U8haHVdf9NPQC1t7ElhKA0IiiKyxo13Cl1OkOMZFnTvyXzuDBQZnLnSIuaf5-cgmR-wi0W1sgknNGZ-GhyxJ49dOBTZZ68s',
              width: 44,
              height: 44,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: const Icon(Icons.person),
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alex Thompson',
                  style: AppTextStyle.labelMedium.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () => _showPrivacyMenu(context),
                  child: Row(
                    children: [
                      Icon(Icons.public, size: 14, color: Colors.grey[500]),
                      const SizedBox(width: 4),
                      Text(
                        _privacyLevel,
                        style: AppTextStyle.bodyMedium.copyWith(
                          fontSize: 11,
                          color: Colors.grey[500],
                        ),
                      ),
                      const SizedBox(width: 2),
                      Icon(
                        Icons.expand_more,
                        size: 12,
                        color: Colors.grey[500],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showPrivacyMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // In a real app, these options would likely come from a more dynamic source
          children: ['Public', 'Friends', 'Private'].map((option) {
            return ListTile(
              title: Text(option),
              onTap: () {
                setState(() => _privacyLevel = option);
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

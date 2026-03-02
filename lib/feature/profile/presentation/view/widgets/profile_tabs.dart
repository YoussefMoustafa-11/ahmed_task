import 'package:flutter/material.dart';
import '../../../../../Core/themes/app_color.dart';

class ProfileTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const ProfileTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: List.generate(
          _TabItem.values.length,
          (index) => Expanded(
            child: _TabButton(
              tabItem: _TabItem.values[index],
              isSelected: selectedIndex == index,
              onTap: () => onTabChanged(index),
            ),
          ),
        ),
      ),
    );
  }
}

enum _TabItem { posts, reels, saved, tagged }

extension _TabItemExtension on _TabItem {
  String get label {
    switch (this) {
      case _TabItem.posts:
        return 'Posts';
      case _TabItem.reels:
        return 'Reels';
      case _TabItem.saved:
        return 'Saved';
      case _TabItem.tagged:
        return 'Tagged';
    }
  }

  IconData get icon {
    switch (this) {
      case _TabItem.posts:
        return Icons.grid_view;
      case _TabItem.reels:
        return Icons.movie;
      case _TabItem.saved:
        return Icons.bookmark;
      case _TabItem.tagged:
        return Icons.account_box;
    }
  }
}

class _TabButton extends StatelessWidget {
  final _TabItem tabItem;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabButton({
    required this.tabItem,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? AppColors.primary : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                tabItem.icon,
                color: isSelected ? AppColors.primary : AppColors.greyText,
                size: 24,
              ),
              const SizedBox(height: 4),
              Text(
                tabItem.label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? AppColors.primary : AppColors.greyText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

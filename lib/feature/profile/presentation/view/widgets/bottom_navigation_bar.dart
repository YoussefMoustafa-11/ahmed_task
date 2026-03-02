import 'package:flutter/material.dart';
import '../../../../../Core/themes/app_color.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const BottomNavigationBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.borderColor, width: 1)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _NavItem.values.length,
              (index) => _NavItemWidget(
                item: _NavItem.values[index],
                isSelected: selectedIndex == index,
                onTap: () => onItemSelected(index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum _NavItem { home, search, create, favorite, profile }

extension _NavItemExtension on _NavItem {
  IconData get icon {
    switch (this) {
      case _NavItem.home:
        return Icons.home_outlined;
      case _NavItem.search:
        return Icons.search;
      case _NavItem.create:
        return Icons.add_box;
      case _NavItem.favorite:
        return Icons.favorite_outline;
      case _NavItem.profile:
        return Icons.account_circle;
    }
  }
}

class _NavItemWidget extends StatelessWidget {
  final _NavItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItemWidget({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 60,
          height: 60,
          child: item == _NavItem.create
              ? _CreateButton(onPressed: onTap)
              : item == _NavItem.profile
              ? _ProfileNavButton(isSelected: isSelected, onTap: onTap)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.icon,
                      color: isSelected
                          ? AppColors.darkText
                          : AppColors.greyText,
                      size: 24,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _CreateButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _CreateButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(8),
            child: Icon(Icons.add_box, color: AppColors.primary, size: 24),
          ),
        ),
      ),
    );
  }
}

class _ProfileNavButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const _ProfileNavButton({required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary, width: 2),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBnpu4hWdkHMpfuLDR-sFbNnUlo4IbohnSghTudhLrNV7VBqPPyuSjsZSI5brz6zc9yjxW3QE96Gq9kzZ-VvlDZCtCrzqAAuytoC2fG6tNwUq4vBPq2_WlWeYmq1W07ZLdVfd2atehA2ZURmzhdtdgq85PSTxJXM9HLJBVXkMB6PCEoIOE4Nf338BZQIvq29waTy_iVEZnuTBAS1VlY_mdmoFNycfwd91G2jGf6WBkJvXugE3yDuQABlrPtBeTzGLI84-0VZ3IlPN0',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

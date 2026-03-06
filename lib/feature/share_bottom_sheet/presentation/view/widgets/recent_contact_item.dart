import 'package:ahmed_task/Core/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class RecentContactItem extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final IconData? icon;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final Color? iconBorderColor;
  final VoidCallback? onTap;

  const RecentContactItem({
    super.key,
    this.imageUrl,
    required this.name,
    this.icon,
    this.iconColor,
    this.iconBackgroundColor,
    this.iconBorderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 64,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (imageUrl != null)
                UserAvatar(imageUrl: imageUrl!, size: 64)
              else
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color:
                        iconBackgroundColor ??
                        const Color(0xFF2B8CEE).withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          iconBorderColor ??
                          const Color(0xFF2B8CEE).withValues(alpha: 0.2),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    icon ?? Icons.add,
                    color: iconColor ?? const Color(0xFF2B8CEE),
                    size: 30,
                  ),
                ),
              const SizedBox(height: 6),
              Text(
                name,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: imageUrl != null
                      ? const Color(0xFF1E293B)
                      : const Color(0xFF64748B),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

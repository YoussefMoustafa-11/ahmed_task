import 'package:flutter/material.dart';
import '../../../../../Core/themes/app_color.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.borderColor, width: 1),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _HeaderButton(
                icon: Icons.arrow_back,
                onPressed: () => Navigator.pop(context),
              ),
              const Text(
                '@alexrivera',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
              ),
              Row(
                children: [
                  _HeaderButton(
                    icon: Icons.notifications_outlined,
                    onPressed: () {},
                  ),
                  _HeaderButton(icon: Icons.more_vert, onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _HeaderButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: 40,
          height: 40,
          child: Icon(icon, color: AppColors.darkText, size: 24),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../../Core/themes/app_color.dart';
import 'profile_image.dart';
import 'package:ahmed_task/Core/widgets/stats_grid.dart';
import 'action_buttons.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          const ProfileImage(),
          const SizedBox(height: 16),
          const Text(
            'Alex Rivera',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.darkText,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Digital Artist & Traveler',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Capturing the world through a unique lens. Sharing my journey and creative process. 📸✨ New York based.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.greyText,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const StatsGrid(),
          const SizedBox(height: 24),
          const ActionButtons(),
        ],
      ),
    );
  }
}

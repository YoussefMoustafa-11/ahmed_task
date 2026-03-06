import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/themes/app_color.dart';

class StatsGrid extends StatelessWidget {
  final List<StatItem> stats;

  const StatsGrid({
    super.key,
    this.stats = const [
      StatItem(value: '128', label: 'Posts'),
      StatItem(value: '15.4K', label: 'Followers'),
      StatItem(value: '432', label: 'Following'),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < stats.length; i++) ...[
          Expanded(child: _StatCard(stat: stats[i])),
          if (i < stats.length - 1) const SizedBox(width: 12),
        ],
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final StatItem stat;

  const _StatCard({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor, width: 1),
      ),
      child: Column(
        children: [
          Text(
            stat.value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.darkText,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            stat.label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.greyText,
            ),
          ),
        ],
      ),
    );
  }
}

class StatItem {
  final String value;
  final String label;

  const StatItem({required this.value, required this.label});
}

import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../data/models/statistic_model.dart';

class StatisticCard extends StatelessWidget {
  const StatisticCard({
    required this.statistic,
    super.key,
  });

  final StatisticModel statistic;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            statistic.value,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: AppColors.secondary,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            statistic.label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

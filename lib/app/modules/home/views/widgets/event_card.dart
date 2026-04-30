import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../data/models/event_model.dart';

class EventCard extends StatelessWidget {
  const EventCard({required this.event, super.key});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(bottom: 8), // Shadow space
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Box
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(19),
                ),
                image: DecorationImage(
                  image: _getImageProvider(
                    event.imageUrl,
                    'https://via.placeholder.com/260x140',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Content Box
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        size: 14,
                        color: AppColors.secondary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        DateFormat('d MMMM, y', 'ar').format(event.date),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ImageProvider _getImageProvider(String url, String fallback) {
    if (url.isEmpty) return NetworkImage(fallback);
    if (url.startsWith('http')) return NetworkImage(url);
    if (url.startsWith('assets/')) return AssetImage(url);
    return NetworkImage(fallback);
  }
}

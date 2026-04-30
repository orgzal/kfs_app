import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../data/models/news_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    required this.news,
    super.key,
  });

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: _getImageProvider(news.imageUrl, 'https://via.placeholder.com/280x280'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              AppColors.primary.withValues(alpha: 0.9),
            ],
            stops: const [0.3, 1.0],
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                news.publishedAt.toIso8601String().split('T')[0],
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              news.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ],
        ),
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

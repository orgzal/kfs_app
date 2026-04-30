import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = _DetailsData.fromArguments(
      Get.arguments,
      fallbackTitle: 'تفاصيل الخبر',
      fallbackDescription: 'لا يوجد وصف متاح لهذا الخبر حاليًا.',
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppBar(
        title: 'تفاصيل الخبر',
        subtitle: 'محافظة كفر الشيخ',
        showSearchField: true,
        showDrawerAction: false,
        showSearchAction: false,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DetailsImage(imageUrl: args.image),
              Transform.translate(
                offset: const Offset(0, -30),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.05),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'أخبار المحافظة',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        args.title,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.primary,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Divider(height: 1),
                      const SizedBox(height: 24),
                      Text(
                        args.description,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                          height: 1.8,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}


class _DetailsData {
  const _DetailsData({
    required this.title,
    required this.image,
    required this.description,
  });

  final String title;
  final String image;
  final String description;

  factory _DetailsData.fromArguments(
    dynamic args, {
    required String fallbackTitle,
    required String fallbackDescription,
  }) {
    if (args is Map<String, dynamic>) {
      return _DetailsData(
        title: (args['title'] as String?)?.trim().isNotEmpty == true
            ? args['title'] as String
            : fallbackTitle,
        image: (args['image'] as String?) ?? (args['imageUrl'] as String?) ?? '',
        description: (args['description'] as String?)?.trim().isNotEmpty == true
            ? args['description'] as String
            : fallbackDescription,
      );
    }

    return _DetailsData(
      title: fallbackTitle,
      image: '',
      description: fallbackDescription,
    );
  }
}

class _DetailsImage extends StatelessWidget {
  const _DetailsImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final hasImage = imageUrl.trim().isNotEmpty;

    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: hasImage
          ? Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const _DetailsImagePlaceholder(
                icon: Icons.article_rounded,
              ),
            )
          : const _DetailsImagePlaceholder(icon: Icons.article_rounded),
    );
  }
}


class _DetailsImagePlaceholder extends StatelessWidget {
  const _DetailsImagePlaceholder({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.08),
      child: Center(
        child: Icon(
          icon,
          size: 52,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../controllers/events_controller.dart';

class EventsView extends GetView<EventsController> {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = _DetailsData.fromArguments(
      Get.arguments,
      fallbackTitle: 'تفاصيل الفعالية',
      fallbackDescription: 'لا يوجد وصف متاح لهذه الفعالية حاليًا.',
    );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(title: args.title),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DetailsImage(imageUrl: args.image),
              const SizedBox(height: 20),
              Text(
                args.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                args.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
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
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: hasImage
          ? Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => _DetailsImagePlaceholder(
                icon: Icons.event_rounded,
              ),
            )
          : const _DetailsImagePlaceholder(icon: Icons.event_rounded),
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

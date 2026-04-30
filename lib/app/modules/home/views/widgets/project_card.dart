import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../data/models/project_model.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    required this.project,
    super.key,
  });

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(19)),
                image: DecorationImage(
                  image: _getImageProvider(project.imageUrl, 'https://via.placeholder.com/250x120'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    project.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    project.status,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
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

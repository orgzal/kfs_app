import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../home/views/widgets/news_card.dart';
import '../controllers/news_controller.dart';
import 'news_view.dart';

class NewsListingView extends GetView<NewsController> {
  const NewsListingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Obx(() {
          if (controller.isLoading.value) {
            return const LoadingWidget(message: 'جار تحميل الأخبار');
          }

          return RefreshIndicator(
            onRefresh: controller.fetchNews,
            color: AppColors.secondary,
            backgroundColor: AppColors.surface,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                _buildHeroBanner(),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
                _buildNewsGrid(),
                const SliverToBoxAdapter(child: SizedBox(height: 120)), // Padding for BottomNavigationBar
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildHeroBanner() {
    return SliverToBoxAdapter(
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1504711434969-e33886168f5c?auto=format&fit=crop&w=1200&q=80'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withValues(alpha: 0.7),
                AppColors.primary.withValues(alpha: 0.85),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'آخر الأخبار والمقالات',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'تابع آخر المستجدات والفعاليات والأخبار الرسمية لمحافظة كفر الشيخ',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewsGrid() {
    if (controller.newsList.isEmpty) {
      return SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              'لا توجد أخبار حالياً',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textPrimary.withValues(alpha: 0.6),
              ),
            ),
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final news = controller.newsList[index];
            return GestureDetector(
              onTap: () => Get.to(() => const NewsView(), arguments: {
                'title': news.title,
                'description': news.content,
                'imageUrl': news.imageUrl,
              }),
              child: NewsCard(news: news),
            );
          },
          childCount: controller.newsList.length,
        ),
      ),
    );
  }
}

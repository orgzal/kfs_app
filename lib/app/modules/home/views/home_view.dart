import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kfs_governorate_app/app/core/constant/app_images.dart';
import 'package:kfs_governorate_app/app/modules/home/views/widgets/custom_circle_button.dart';
import 'package:kfs_governorate_app/app/modules/home/views/widgets/home_banner.dart';
import 'package:kfs_governorate_app/app/modules/home/views/widgets/map_card.dart';
import 'package:kfs_governorate_app/app/modules/home/views/widgets/selectionBox.dart';
import 'package:kfs_governorate_app/app/modules/home/views/widgets/tourism_pageview.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../data/models/banner_model.dart';
import '../controllers/home_controller.dart';
import 'widgets/event_card.dart';
import 'widgets/news_card.dart';
import 'widgets/project_card.dart';
import 'widgets/statistic_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  static const List<String> _investmentImages = [
    'https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?auto=format&fit=crop&w=900&q=80',
    'https://images.unsplash.com/photo-1462899006636-339e08d1844e?auto=format&fit=crop&w=900&q=80',
    'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=900&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Obx(() {
          if (controller.isLoading.value) {
            return const LoadingWidget(message: 'جار تحميل المحتوى');
          }

          return RefreshIndicator(
            onRefresh: controller.fetchHomeData,
            color: AppColors.primary,
            backgroundColor: AppColors.surface,
            child: CustomScrollView(
              slivers: [
                // SliverToBoxAdapter(
                //   child: Container(height: 24, color: AppColors.surface),
                // ),
                SliverToBoxAdapter(
                  child: HomeBanner(heightCarousal: 220 * 2, isDark: false),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
                _buildHeroSlider(),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
                _buildEventsSection(),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
                _buildNewsSection(),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
                _buildServicesSection(),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
                _buildTourismSection(),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
                _buildInvestmentSection(),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
                _buildProjectsSection(),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
                _buildStrategicBanner(),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
                _buildUsefulLinksSection(),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
                _buildStatisticsSection(),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
                MapScreen(),
                _buildFooter(),
              ],
            ),
          );
        }),
      ),
    );
  }

  // Section Title Helper (Gold line + Title)
  Widget _buildSectionTitle(String title, {String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 6,
                height: 25,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(right: 12, left: 12),
              child: Text(
                subtitle,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // 2. Hero Slider
  Widget _buildHeroSlider() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 220,
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.9),
          itemCount: controller.banners.isNotEmpty
              ? controller.banners.length
              : 1, // Safe dummy
          itemBuilder: (context, index) {
            final banner = controller.banners.isNotEmpty
                ? controller.banners[index]
                : const BannerModel(
                    id: 1,
                    title: 'مرحباً بكم في كفر الشيخ',
                    subtitle: 'نعمل من أجل مستقبل أفضل',
                    targetRoute: 'المزيد',
                    imageUrl: '',
                    isActive: true,
                  );
            return _HeroBannerCard(banner: banner);
          },
        ),
      ),
    );
  }

  // 3. Events
  Widget _buildEventsSection() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
            'أهم الفعاليات',
            subtitle:
                "تابع أخر الفعليات والقرارات الرسمية داخل محافظة كفرالشيخ.",
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 250,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: controller.importantEvents.length,
              separatorBuilder: (_, _) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                return EventCard(event: controller.importantEvents[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // 4. News
  Widget _buildNewsSection() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionTitle(
                  'آخر الأخبار',
                  subtitle:
                      "تحديثات يومية تسلط الضوء علي آخر أخبار \nوتحديثات المحافظة.",
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'عرض الكل',
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 230,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: controller.latestNews.length,
              separatorBuilder: (_, _) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                return NewsCard(news: controller.latestNews[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // 5. Services
  Widget _buildServicesSection() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
            'الخدمات الحكومية',
            subtitle:
                'مجموعة من الخدمات الإلكترونية الموجهة لخدمة مواطني كفرالشيخ.',
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                int columns = 1;
                if (constraints.maxWidth > 1100) {
                  columns = 3;
                } else if (constraints.maxWidth > 700) {
                  columns = 2;
                }
                double width = constraints.maxWidth / columns;
                return Wrap(
                  children: [
                    SelectionBox(
                      width: width,
                      icon: Icons.build,
                      title: 'خدمة إختبار',
                    ),
                    SizedBox(width: 12),
                    SelectionBox(
                      width: width,
                      icon: Icons.bookmark,
                      title: 'استدامة للتدريب والتطوير',
                    ),
                    SizedBox(width: 12),
                    SelectionBox(
                      width: width,
                      icon: Icons.design_services_rounded,
                      title: 'الخدمات المكانية',
                    ),
                  ],
                );
              },
            ),
          ),

          // SizedBox(
          //   height: 160,
          //   child: ListView.separated(
          //     padding: const EdgeInsets.symmetric(horizontal: 16),
          //     scrollDirection: Axis.horizontal,
          //     itemCount: controller.services.length,
          //     separatorBuilder: (_, _) => const SizedBox(width: 16),
          //     itemBuilder: (context, index) {
          //       return ServiceCard(service: controller.services[index]);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  // 6. Tourism Section
  Widget _buildTourismSection() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildSectionTitle(
            'المعالم السياحية',
            subtitle:
                'اكتشف أبرز المواقع التاريخية والطبيعية التي تميز محافظة كفرالشيخ.',
          ),
          const SizedBox(height: 16),
          AnimatedPageViewTourism(),

          // SizedBox(
          //   height: 180,
          //   child: ListView.separated(
          //     padding: const EdgeInsets.symmetric(horizontal: 16),
          //     scrollDirection: Axis.horizontal,
          //     itemCount: controller.tourismPlaces.length,
          //     separatorBuilder: (_, _) => const SizedBox(width: 16),
          //     itemBuilder: (context, index) {
          //       final item = controller.tourismPlaces[index];
          //       return _RichInfoCard(
          //         title: item.name,
          //         subtitle: item.description,
          //         imageUrl: item.imageUrl,
          //         overlayStyle: true,
          //       );
          //     },
          //   ),
          // ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.secondary, width: 2),
              ),
            ),
            child: Text(
              'كل مكان ليه حكاية مختلفة',
              style: GoogleFonts.rakkas(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 28),
        ],
      ),
    );
  }

  // 7. Investment
  Widget _buildInvestmentSection() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
            'فرص الاستثمار',
            subtitle:
                "اكتشف أبرز المناطق والفرص الاستثمارية الواعدة في مختلف قطاعات المحافظة",
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 180,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: controller.investments.length,
              separatorBuilder: (_, _) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final item = controller.investments[index];
                return _GoldBrandedCard(
                  title: item.title,
                  subtitle: item.description,
                  imageUrl: _investmentImages[index % _investmentImages.length],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // 8. Projects
  Widget _buildProjectsSection() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('المشروعات القومية'),
          const SizedBox(height: 16),
          SizedBox(
            height: 220,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: controller.projects.length,
              separatorBuilder: (_, _) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                return ProjectCard(project: controller.projects[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // 9. Strategic Plan Banner
  Widget _buildStrategicBanner() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 14),
              Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: AppColors.secondary,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Center(
                    child: Text(
                      "خارطة التنمية",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14),
              const Text(
                'مشروعات الخطة الاستثمارية لمحافظة كفر الشيخ',
                style: TextStyle(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "اطلع علي الخطة الاستثمارية السنوية للمحافظة, والتقارير الموثقة للعام الحالي والاعوام السابقة . نحن نرسم ملامح المستقبل من خلال رؤية وطنية تهدف الي تحسين البنية التحتية والخدمات وتوطين التنمية المستدامة في كاقة المراكز.",
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  height: 1.6,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(120, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'اكتشف المزيد',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 10. Links
  Widget _buildUsefulLinksSection() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('مواقع وتطبيقات هامة'),
          const SizedBox(height: 16),
          SizedBox(
            height: 140,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: controller.importantLinks.length,
              separatorBuilder: (_, _) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final item = controller.importantLinks[index];
                return _RichInfoCard(
                  title: item['title'] ?? '',
                  subtitle: item['subtitle'] ?? '',
                  imageUrl: '',
                  overlayStyle: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // 11. Statistics
  Widget _buildStatisticsSection() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('المحافظة في أرقام'),
          const SizedBox(height: 16),
          SizedBox(
            height: 120,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: controller.statistics.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return StatisticCard(statistic: controller.statistics[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // 12. Footer
  Widget _buildFooter() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        color: AppColors.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.logo, height: 100),

            SizedBox(height: 10),
            Text("البوابة الالكترونية لمحافظة كفر الشيخ."),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleButton(
                  icon: Icons.whatshot_sharp,
                  iconColor: AppColors.primary,
                  borderColor: Colors.transparent,
                  backgroundColor: AppColors.grey,
                  iconSize: 22,
                  padding: 6,
                ),
                SizedBox(width: 6),
                CircleButton(
                  icon: Icons.facebook_rounded,
                  iconColor: AppColors.primary,
                  borderColor: Colors.transparent,
                  backgroundColor: AppColors.grey,
                  iconSize: 22,
                  padding: 6,
                ),
                SizedBox(width: 6),
                CircleButton(
                  icon: Icons.telegram,
                  iconColor: AppColors.primary,
                  borderColor: Colors.transparent,
                  backgroundColor: AppColors.grey,
                  iconSize: 22,
                  padding: 6,
                ),
                SizedBox(width: 6),
                CircleButton(
                  icon: Icons.tiktok,
                  iconColor: AppColors.primary,
                  borderColor: Colors.transparent,
                  backgroundColor: AppColors.grey,
                  iconSize: 22,
                  padding: 6,
                ),
                SizedBox(width: 6),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Inline Sub-components for specialized looks

ImageProvider _getImageProvider(String url, String fallback) {
  if (url.isEmpty) return NetworkImage(fallback);
  if (url.startsWith('http')) return NetworkImage(url);
  if (url.startsWith('assets/')) return AssetImage(url);
  return NetworkImage(fallback);
}

class _HeroBannerCard extends StatelessWidget {
  const _HeroBannerCard({required this.banner});

  final BannerModel banner;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(end: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: _getImageProvider(
            banner.imageUrl,
            'https://via.placeholder.com/400x220',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              AppColors.primary.withValues(alpha: 0.8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              banner.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              banner.subtitle,
              maxLines: 2,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RichInfoCard extends StatelessWidget {
  const _RichInfoCard({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.overlayStyle,
  });

  final String title;
  final String subtitle;
  final String imageUrl;
  final bool overlayStyle;

  @override
  Widget build(BuildContext context) {
    if (overlayStyle) {
      return Container(
        width: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: _getImageProvider(
              imageUrl,
              'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=900&q=80',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withValues(alpha: 0.7)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Clean card for Links
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.link_rounded, color: AppColors.primary),
          ),
          const Spacer(),
          Text(
            title,
            maxLines: 1,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _GoldBrandedCard extends StatelessWidget {
  const _GoldBrandedCard({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  final String title;
  final String subtitle;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: _getImageProvider(
            imageUrl,
            'https://via.placeholder.com/250x120',
          ),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withValues(alpha: 0.10),
              AppColors.primary.withValues(alpha: 0.85),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.trending_up_rounded,
                color: Colors.white,
                size: 26,
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

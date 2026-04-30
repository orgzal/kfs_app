import 'package:curved_navigation_bar_pro/curved_navigation_bar_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../routes/app_routes.dart';
import '../../news/views/news_listing_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/main_shell_controller.dart';
import '../../../core/widgets/custom_app_bar.dart';
import 'widgets/custom_drawer.dart';

class MainShellView extends GetView<MainShellController> {
  const MainShellView({super.key});

  int _getSelectedIndex(String route) {
    if (route == AppRoutes.home) return 0;
    if (route == AppRoutes.news) return 1;
    if (route == AppRoutes.services) return 2;
    if (route == AppRoutes.projects) return 3;
    return -1;
  }

  // Widget _buildNavItem(String label, IconData icon, int index) {
  //   final isSelected =
  //       _getSelectedIndex(controller.selectedRoute.value) == index;
  //   final routes = [
  //     AppRoutes.home,
  //     AppRoutes.news,
  //     AppRoutes.services,
  //     AppRoutes.projects,
  //   ];

  //   return GestureDetector(
  //     onTap: () => controller.navigateTo(routes[index]),
  //     behavior: HitTestBehavior.opaque,
  //     child: AnimatedContainer(
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.easeOutQuint,
  //       padding: EdgeInsets.symmetric(
  //         horizontal: isSelected ? 18 : 12,
  //         vertical: 12,
  //       ),
  //       decoration: BoxDecoration(
  //         color: isSelected ? AppColors.secondary : Colors.transparent,
  //         borderRadius: BorderRadius.circular(24),
  //         boxShadow: isSelected
  //             ? [
  //                 BoxShadow(
  //                   color: AppColors.secondary.withValues(alpha: 0.4),
  //                   blurRadius: 12,
  //                   offset: const Offset(0, 4),
  //                 ),
  //               ]
  //             : null,
  //       ),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Icon(
  //             icon,
  //             color: isSelected
  //                 ? AppColors.primary
  //                 : Colors.white.withValues(alpha: 0.6),
  //             size: 24,
  //           ),
  //           if (isSelected) ...[
  //             const SizedBox(width: 8),
  //             Text(
  //               label,
  //               style: const TextStyle(
  //                 color: AppColors.primary,
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 13,
  //               ),
  //             ),
  //           ],
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildSectionPlaceholder(dynamic section) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.surface,
                    AppColors.surface.withValues(alpha: 0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.1),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    section.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    section.subtitle,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: AppColors.textPrimary.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.05),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.construction_rounded,
                    size: 64,
                    color: AppColors.primary.withValues(alpha: 0.2),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'قريباً',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary.withValues(alpha: 0.4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.syncSelectedRoute(Get.currentRoute);

    return Obx(() {
      return Scaffold(
        // extendBody: true,
        backgroundColor: AppColors.surface,
        appBar: CustomAppBar(
          title: controller.currentTitle,
          subtitle: 'كفر الشيخ الرقمية',
          showDrawerAction: true,
          showSearchField: true,
        ),
        drawer: const CustomDrawer(),
        body: _getSelectedIndex(controller.selectedRoute.value) != -1
            ? PageView(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                physics: const BouncingScrollPhysics(),
                children: [
                  const HomeView(),
                  const NewsListingView(),
                  _buildSectionPlaceholder(
                    controller.getSectionData(AppRoutes.services),
                  ),
                  _buildSectionPlaceholder(
                    controller.getSectionData(AppRoutes.projects),
                  ),
                ],
              )
            : _buildSectionPlaceholder(controller.currentSection),
        bottomNavigationBar: Directionality(
          textDirection: TextDirection.ltr,
          child: CurvedNavigationBarPro(
            currentIndex: controller.index.value,
            items: [
              CurvedNavigationItemPro(
                label: 'الرئيسية',
                activeIcon: Icons.home_rounded,
                inactiveIcon: Icons.home_outlined,
              ),
              CurvedNavigationItemPro(
                label: 'الأخبار',
                activeIcon: Icons.article_rounded,
                inactiveIcon: Icons.article_outlined,
              ),
              CurvedNavigationItemPro(
                label: 'الخدمات',
                activeIcon: Icons.miscellaneous_services_rounded,
                inactiveIcon: Icons.miscellaneous_services_outlined,
              ),
              CurvedNavigationItemPro(
                label: 'المشروعات',
                activeIcon: Icons.account_tree_rounded,
                inactiveIcon: Icons.account_tree_outlined,
              ),
            ],
            backgroundColor: AppColors.colorWhite,
            activeColor: AppColors.primary,
            activeIconColor: AppColors.colorWhite,
            inactiveColor: AppColors.textPrimary.withValues(alpha: 0.7),
            fabColor: AppColors.primary,
            // barHeight: 110,
            // fabRadius: 28,
            // fabGap: 10,
            // fabSink: 22,
            // cornerRadius: 16,
            elevation: 14,
            shadowColor: Colors.black26,
            // animationDuration: Duration(milliseconds: 400),
            // animationCurve: Curves.easeInOutCubic,
            // activeIconSize: 24,
            // inactiveIconSize: 22,
            activeTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            inactiveTextStyle: TextStyle(fontSize: 14),
            navbarStyle: CNBPStyles.emeraldPill,
            onTap: (int index) => controller.changeIndexNav(index),
          ),
        ),

        //  SafeArea(
        //   child: Padding(
        //     padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        //     child: Container(
        //       height: 72,
        //       decoration: BoxDecoration(
        //         gradient: const LinearGradient(
        //           begin: Alignment.topRight,
        //           end: Alignment.bottomLeft,
        //           colors: [
        //             Color(0xFF244C79),
        //             Color(0xFF1A3D67),
        //             Color(0xFF173457),
        //           ],
        //         ),
        //         borderRadius: BorderRadius.circular(36),
        //         boxShadow: [
        //           BoxShadow(
        //             color: AppColors.primary.withValues(alpha: 0.15),
        //             blurRadius: 20,
        //             offset: const Offset(0, 10),
        //           ),
        //         ],
        //       ),
        //       child: Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 10),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             _buildNavItem('الرئيسية', Icons.home_rounded, 0),
        //             _buildNavItem('الأخبار', Icons.article_rounded, 1),
        //             _buildNavItem('الخدمات', Icons.miscellaneous_services_rounded, 2),
        //             _buildNavItem('المشروعات', Icons.account_tree_rounded, 3),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      );
    });
  }
}

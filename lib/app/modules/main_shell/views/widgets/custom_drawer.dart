import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../controllers/main_shell_controller.dart';

class CustomDrawer extends GetView<MainShellController> {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
        ),
        backgroundColor: AppColors.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Premium Header Section
            Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF244C79),
                    Color(0xFF1A3D67),
                    Color(0xFF173457),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'محافظة كفر الشيخ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'بوابة الخدمات الرقمية',
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            
            // Menu Items List
            Expanded(
              child: Obx(
                () => ListView(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  physics: const BouncingScrollPhysics(),
                  children: controller.menuItems
                      .map(
                        (item) => _DrawerTile(
                          label: item.label,
                          icon: item.icon,
                          route: item.route,
                          selected: controller.selectedRoute.value == item.route,
                          onTap: () => controller.navigateTo(item.route),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            
            // Footer Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                   Divider(color: AppColors.primary.withValues(alpha: 0.05)),
                   const SizedBox(height: 10),
                   Text(
                    'الإصدار 1.0.0',
                    style: TextStyle(
                      color: AppColors.textPrimary.withValues(alpha: 0.4),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
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
}

class _DrawerTile extends StatelessWidget {
  const _DrawerTile({
    required this.label,
    required this.icon,
    required this.route,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final String route;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary.withValues(alpha: 0.05) : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: selected 
              ? Border.all(color: AppColors.primary.withValues(alpha: 0.1), width: 1)
              : null,
          ),
          child: Row(
            children: [
              // Icon Container
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: selected ? AppColors.primary : AppColors.background,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: selected ? Colors.white : AppColors.primary,
                ),
              ),
              const SizedBox(width: 16),
              // Label
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: selected ? AppColors.primary : AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                  ),
                ),
              ),
              // Selection Indicator
              if (selected)
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class MainShellController extends GetxController {
  final RxBool isLoading = false.obs;
  RxInt index = 0.obs;
  final RxList<String> mockItems = <String>[
    'home',
    'news',
    'events',
    'services',
  ].obs;
  final RxMap<String, dynamic> mockData = <String, dynamic>{
    'currentSection': 'home',
    'hasDrawer': true,
  }.obs;

  final PageController pageController = PageController();
  final indexToRoute = [
    AppRoutes.home,
    AppRoutes.news,
    AppRoutes.services,
    AppRoutes.projects,
  ];

  int get currentTabIndex => indexToRoute.indexOf(selectedRoute.value);
  void changeIndexNav(int indexNav) {
    index.value = indexNav;
    final routes = [
      AppRoutes.home,
      AppRoutes.news,
      AppRoutes.services,
      AppRoutes.projects,
    ];
    navigateTo(routes[indexNav]);
  }

  final RxString selectedRoute = AppRoutes.home.obs;

  final List<ShellMenuItem> menuItems = const [
    ShellMenuItem(
      label: 'الرئيسية',
      route: AppRoutes.home,
      icon: Icons.home_rounded,
    ),
    ShellMenuItem(
      label: 'الأخبار',
      route: AppRoutes.news,
      icon: Icons.article_rounded,
    ),
    ShellMenuItem(
      label: 'الخدمات',
      route: AppRoutes.services,
      icon: Icons.miscellaneous_services_rounded,
    ),
    ShellMenuItem(
      label: 'المشروعات',
      route: AppRoutes.projects,
      icon: Icons.account_tree_rounded,
    ),
    ShellMenuItem(
      label: 'الاستثمار',
      route: AppRoutes.investment,
      icon: Icons.trending_up_rounded,
    ),
    ShellMenuItem(
      label: 'السياحة',
      route: AppRoutes.tourism,
      icon: Icons.map_rounded,
    ),
    ShellMenuItem(
      label: 'التدريب والتطوير',
      route: AppRoutes.training,
      icon: Icons.school_rounded,
    ),
    ShellMenuItem(
      label: 'تواصل معنا',
      route: AppRoutes.contact,
      icon: Icons.contact_support_rounded,
    ),
    ShellMenuItem(
      label: 'تسجيل الدخول',
      route: AppRoutes.login,
      icon: Icons.login_rounded,
    ),
    ShellMenuItem(
      label: 'تسجيل جديد',
      route: AppRoutes.register,
      icon: Icons.person_add_rounded,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    syncSelectedRoute(Get.currentRoute);
  }

  void syncSelectedRoute(String route) {
    selectedRoute.value = _normalizeRoute(route);
    mockData['currentSection'] = selectedRoute.value;

    // Sync PageController if needed (initially)
    int index = indexToRoute.indexOf(selectedRoute.value);
    if (index != -1) {
      // Small delay to ensure PageView is built if we just switched to it
      Future.delayed(Duration.zero, () {
        if (pageController.hasClients) {
          pageController.jumpToPage(index);
        }
      });
    }
  }

  void onPageChanged(int index) {
    if (index >= 0 && index < indexToRoute.length) {
      selectedRoute.value = indexToRoute[index];
      mockData['currentSection'] = selectedRoute.value;
    }
  }

  void navigateTo(String route) {
    if (Get.isOverlaysOpen) {
      Get.back();
    }

    int index = indexToRoute.indexOf(route);
    if (index != -1) {
      selectedRoute.value = route;
      mockData['currentSection'] = route;

      Future.delayed(Duration.zero, () {
        if (pageController.hasClients) {
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutQuint,
          );
        } else {
          // If PageView was just added to tree, we might need to jump instead of animate
          // Or the PageView will pick it up via its controller if we set initialPage
          // but PageController's initialPage is final.
          // So we re-create or jump.
        }
      });
      return;
    }

    if (selectedRoute.value == route && Get.currentRoute == route) {
      return;
    }

    selectedRoute.value = route;
    mockData['currentSection'] = route;
    Get.toNamed(route);
  }

  String get currentTitle {
    return menuItems
            .firstWhereOrNull((item) => item.route == selectedRoute.value)
            ?.label ??
        'الرئيسية';
  }

  ShellSectionData get currentSection => getSectionData(selectedRoute.value);

  ShellSectionData getSectionData(String route) {
    switch (route) {
      case AppRoutes.news:
        return const ShellSectionData(
          title: 'الأخبار',
          subtitle:
              'متابعة آخر الأخبار والبيانات المحلية من خلال مساحة محتوى قابلة للتوسعة لاحقًا.',
        );
      case AppRoutes.services:
        return const ShellSectionData(
          title: 'الخدمات',
          subtitle:
              'منطقة مخصصة لعرض الخدمات الحكومية والرقمية وربطها بالنماذج والطلبات لاحقًا.',
        );
      case AppRoutes.projects:
        return const ShellSectionData(
          title: 'المشروعات',
          subtitle:
              'حاوية أولية لمتابعة المشروعات التنموية وحالات التنفيذ والتقارير.',
        );
      case AppRoutes.investment:
        return const ShellSectionData(
          title: 'الاستثمار',
          subtitle: 'مكان مهيأ لعرض الفرص الاستثمارية والقطاعات والمحفزات.',
        );
      case AppRoutes.tourism:
        return const ShellSectionData(
          title: 'السياحة',
          subtitle:
              'قسم مبدئي لإبراز المقاصد السياحية والفعاليات والمحتوى التعريفي.',
        );
      case AppRoutes.training:
        return const ShellSectionData(
          title: 'التدريب والتطوير',
          subtitle:
              'مساحة تدريبية قابلة لعرض البرامج والمسارات ونماذج التسجيل لاحقًا.',
        );
      case AppRoutes.contact:
        return const ShellSectionData(
          title: 'تواصل معنا',
          subtitle: 'قسم مهيأ لقنوات التواصل ونماذج الاستفسارات والدعم.',
        );
      case AppRoutes.login:
        return const ShellSectionData(
          title: 'تسجيل الدخول',
          subtitle: 'واجهة دخول أولية سيتم ربطها بالتحقق والجلسات لاحقًا.',
        );
      case AppRoutes.register:
        return const ShellSectionData(
          title: 'تسجيل جديد',
          subtitle: 'منطقة تسجيل أولية لإنشاء الحسابات وربط التحقق لاحقًا.',
        );
      case AppRoutes.events:
        return const ShellSectionData(
          title: 'الفعاليات',
          subtitle: 'حاوية للفعاليات والمواعيد والأنشطة الرسمية.',
        );
      case AppRoutes.mainShell:
      case AppRoutes.home:
      default:
        return const ShellSectionData(
          title: 'الرئيسية',
          subtitle:
              'نقطة الدخول الأساسية للتطبيق، وتُستخدم كمنطقة عرض ديناميكية للمحتوى الرئيسي.',
        );
    }
  }

  String _normalizeRoute(String route) {
    if (route == AppRoutes.mainShell || route.isEmpty) {
      return AppRoutes.home;
    }

    const supportedRoutes = <String>{
      AppRoutes.home,
      AppRoutes.news,
      AppRoutes.events,
      AppRoutes.services,
      AppRoutes.projects,
      AppRoutes.investment,
      AppRoutes.tourism,
      AppRoutes.training,
      AppRoutes.contact,
      AppRoutes.login,
      AppRoutes.register,
    };

    return supportedRoutes.contains(route) ? route : AppRoutes.home;
  }
}

class ShellMenuItem {
  const ShellMenuItem({
    required this.label,
    required this.route,
    required this.icon,
  });

  final String label;
  final String route;
  final IconData icon;
}

class ShellSectionData {
  const ShellSectionData({required this.title, required this.subtitle});

  final String title;
  final String subtitle;
}

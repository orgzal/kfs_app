import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/providers/local_mock_provider.dart';
import '../../modules/main_shell/controllers/main_shell_controller.dart';
import '../../routes/app_routes.dart';
import '../theme/app_colors.dart';

class AppSearchDelegate extends SearchDelegate<void> {
  AppSearchDelegate({String? hintText, LocalMockProvider? localMockProvider})
    : _hintText = hintText ?? 'ابحث في التطبيق',
      _localMockProvider = localMockProvider ?? LocalMockProvider();

  final String _hintText;
  final LocalMockProvider _localMockProvider;

  late final Future<List<_SearchEntry>> _entriesFuture = _loadEntries();

  @override
  String get searchFieldLabel => _hintText;

  @override
  TextInputAction get textInputAction => TextInputAction.search;

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);

    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.primary,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      scaffoldBackgroundColor: AppColors.background,
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: AppColors.textSecondary),
      ),
      textTheme: theme.textTheme.copyWith(
        titleLarge: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back_rounded),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          onPressed: () => query = '',
          icon: const Icon(Icons.close_rounded),
        ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return _SearchResultsView(
      entriesFuture: _entriesFuture,
      query: query,
      onSelected: (entry) => _selectEntry(context, entry),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _SearchResultsView(
      entriesFuture: _entriesFuture,
      query: query,
      onSelected: (entry) => _selectEntry(context, entry),
    );
  }

  Future<List<_SearchEntry>> _loadEntries() async {
    final news = await _localMockProvider.getNews();
    final events = await _localMockProvider.getEvents();
    final services = await _localMockProvider.getServices();
    final projects = await _localMockProvider.getProjects();
    final investments = await _localMockProvider.getInvestments();
    final tourismPlaces = await _localMockProvider.getTourismPlaces();

    return <_SearchEntry>[
      const _SearchEntry(
        title: 'الرئيسية',
        subtitle: 'الصفحة الرئيسية للتطبيق',
        route: AppRoutes.home,
        section: 'التنقل',
        icon: Icons.home_rounded,
      ),
      const _SearchEntry(
        title: 'الأخبار',
        subtitle: 'آخر الأخبار والتحديثات المحلية',
        route: AppRoutes.news,
        section: 'التنقل',
        icon: Icons.article_rounded,
      ),
      const _SearchEntry(
        title: 'الخدمات',
        subtitle: 'الخدمات الحكومية والرقمية',
        route: AppRoutes.services,
        section: 'التنقل',
        icon: Icons.miscellaneous_services_rounded,
      ),
      const _SearchEntry(
        title: 'المشروعات',
        subtitle: 'متابعة المشروعات والتنمية',
        route: AppRoutes.projects,
        section: 'التنقل',
        icon: Icons.account_tree_rounded,
      ),
      const _SearchEntry(
        title: 'الاستثمار',
        subtitle: 'فرص ومجالات الاستثمار',
        route: AppRoutes.investment,
        section: 'التنقل',
        icon: Icons.trending_up_rounded,
      ),
      const _SearchEntry(
        title: 'السياحة',
        subtitle: 'المعالم والوجهات السياحية',
        route: AppRoutes.tourism,
        section: 'التنقل',
        icon: Icons.map_rounded,
      ),
      const _SearchEntry(
        title: 'التدريب والتطوير',
        subtitle: 'البرامج التدريبية والمسارات',
        route: AppRoutes.training,
        section: 'التنقل',
        icon: Icons.school_rounded,
      ),
      const _SearchEntry(
        title: 'تواصل معنا',
        subtitle: 'قنوات التواصل والدعم',
        route: AppRoutes.contact,
        section: 'التنقل',
        icon: Icons.contact_support_rounded,
      ),
      const _SearchEntry(
        title: 'تسجيل الدخول',
        subtitle: 'الدخول إلى الحساب',
        route: AppRoutes.login,
        section: 'الحساب',
        icon: Icons.login_rounded,
      ),
      const _SearchEntry(
        title: 'تسجيل جديد',
        subtitle: 'إنشاء حساب جديد',
        route: AppRoutes.register,
        section: 'الحساب',
        icon: Icons.person_add_rounded,
      ),
      ...news.map(
        (item) => _SearchEntry(
          title: item.title,
          subtitle: item.summary,
          route: AppRoutes.news,
          section: 'الأخبار',
          icon: Icons.article_outlined,
          keywords: [item.category, item.content],
        ),
      ),
      ...events.map(
        (item) => _SearchEntry(
          title: item.title,
          subtitle: '${item.location} • ${item.description}',
          route: AppRoutes.events,
          section: 'الفعاليات',
          icon: Icons.event_rounded,
          keywords: [item.location],
        ),
      ),
      ...services.map(
        (item) => _SearchEntry(
          title: item.name,
          subtitle: item.description,
          route: item.route,
          section: 'الخدمات',
          icon: Icons.miscellaneous_services_outlined,
          keywords: [item.iconKey],
        ),
      ),
      ...projects.map(
        (item) => _SearchEntry(
          title: item.title,
          subtitle: '${item.status} • ${item.description}',
          route: AppRoutes.projects,
          section: 'المشروعات',
          icon: Icons.account_tree_outlined,
          keywords: [item.status],
        ),
      ),
      ...investments.map(
        (item) => _SearchEntry(
          title: item.title,
          subtitle: '${item.sector} • ${item.location}',
          route: AppRoutes.investment,
          section: 'الاستثمار',
          icon: Icons.trending_up_outlined,
          keywords: [item.sector, item.description, item.location],
        ),
      ),
      ...tourismPlaces.map(
        (item) => _SearchEntry(
          title: item.name,
          subtitle: '${item.address} • ${item.description}',
          route: AppRoutes.tourism,
          section: 'السياحة',
          icon: Icons.place_outlined,
          keywords: [item.address],
        ),
      ),
    ];
  }

  void _selectEntry(BuildContext context, _SearchEntry entry) {
    close(context, null);

    Future<void>.microtask(() {
      if (Get.isRegistered<MainShellController>()) {
        Get.find<MainShellController>().navigateTo(entry.route);
        return;
      }

      if (Get.currentRoute != entry.route) {
        Get.toNamed(entry.route);
      }
    });
  }
}

class _SearchResultsView extends StatelessWidget {
  const _SearchResultsView({
    required this.entriesFuture,
    required this.query,
    required this.onSelected,
  });

  final Future<List<_SearchEntry>> entriesFuture;
  final String query;
  final ValueChanged<_SearchEntry> onSelected;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: FutureBuilder<List<_SearchEntry>>(
        future: entriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.secondary),
            );
          }

          final entries = snapshot.data ?? const <_SearchEntry>[];
          final filteredEntries = _filterEntries(entries, query);

          if (filteredEntries.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  query.trim().isEmpty
                      ? 'ابدأ بكتابة ما تريد البحث عنه'
                      : 'لا توجد نتائج مطابقة لـ "$query"',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            itemCount: filteredEntries.length,
            separatorBuilder: (_, _) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final entry = filteredEntries[index];

              return Material(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () => onSelected(entry),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(
                            entry.icon,
                            color: AppColors.primary,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                entry.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: AppColors.textPrimary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                entry.subtitle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 13,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.secondary.withValues(
                                    alpha: 0.16,
                                  ),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Text(
                                  entry.section,
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  List<_SearchEntry> _filterEntries(List<_SearchEntry> entries, String query) {
    final normalizedQuery = _normalize(query);
    if (normalizedQuery.isEmpty) {
      return entries.take(8).toList();
    }

    final terms = normalizedQuery
        .split(RegExp(r'\s+'))
        .where((term) => term.isNotEmpty)
        .toList();

    final matches = entries.where((entry) {
      return terms.every(entry.searchableText.contains);
    }).toList();

    matches.sort((a, b) {
      final aStartsWith = a.searchableText.startsWith(normalizedQuery);
      final bStartsWith = b.searchableText.startsWith(normalizedQuery);
      if (aStartsWith != bStartsWith) {
        return aStartsWith ? -1 : 1;
      }
      return a.title.length.compareTo(b.title.length);
    });

    return matches;
  }

  String _normalize(String value) {
    return value.trim().toLowerCase();
  }
}

class _SearchEntry {
  const _SearchEntry({
    required this.title,
    required this.subtitle,
    required this.route,
    required this.section,
    required this.icon,
    this.keywords = const <String>[],
  });

  final String title;
  final String subtitle;
  final String route;
  final String section;
  final IconData icon;
  final List<String> keywords;

  String get searchableText {
    return [
      title,
      subtitle,
      section,
      route,
      ...keywords,
    ].join(' ').trim().toLowerCase();
  }
}

import 'package:flutter/material.dart';
import 'app_search_delegate.dart';
import '../theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    super.key,
    this.leading,
    this.actions,
    this.centerTitle = false,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation = 0.5,
    this.bottom,
    this.showLogo = true,
    this.showDrawerAction = false,
    this.subtitle,
    this.showSearchField = false,
    this.searchHint,
    this.showSearchAction = true,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double elevation;
  final PreferredSizeWidget? bottom;
  final bool showLogo;
  final bool showDrawerAction;
  final String? subtitle;
  final bool showSearchField;
  final String? searchHint;
  final bool showSearchAction;

  @override
  Size get preferredSize => Size.fromHeight(
    (showSearchField ? 100.0 : 60.0) + (bottom?.preferredSize.height ?? 0),
  );

  @override
  Widget build(BuildContext context) {
    if (showSearchField) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          titleSpacing: 0,
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                // bottomLeft: Radius.circular(28),
                // bottomRight: Radius.circular(28),
              ),
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF244C79),
                  Color(0xFF1A3D67),
                  Color(0xFF173457),
                ],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -20,
                  right: -20,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.04),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -10,
                  left: -30,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          leadingWidth: 72,
          leading: showDrawerAction
              ? Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16),
                  child: Center(
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.08),
                        ),
                      ),
                      child: Builder(
                        builder: (context) => IconButton(
                          onPressed: () => Scaffold.of(context).openDrawer(),
                          icon: const Icon(
                            Icons.menu_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Builder(
                  builder: (context) {
                    if (Navigator.canPop(context)) {
                      return Padding(
                        padding: const EdgeInsetsDirectional.only(start: 16),
                        child: Center(
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.08),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),

          title: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 2),
                Text(
                  subtitle!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ],
          ),
          actions: showSearchAction
              ? [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 16),
                    child: Center(
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.08),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () => _openSearch(context),
                          icon: const Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              : null,
          bottom: bottom,
        ),
      );
    }

    final defaultActions = <Widget>[
      if (showDrawerAction)
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded, color: AppColors.textPrimary),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      IconButton(
        icon: const Icon(Icons.search_rounded, color: AppColors.textPrimary),
        onPressed: () => _openSearch(context),
      ),
      const SizedBox(width: 8),
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showLogo) ...[
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.account_balance_rounded,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
            ],
            Flexible(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        leading: leading,
        actions: actions ?? defaultActions,
        centerTitle: centerTitle,
        elevation: elevation,
        scrolledUnderElevation: elevation,
        backgroundColor: backgroundColor ?? AppColors.surface,
        foregroundColor: foregroundColor ?? AppColors.textPrimary,
        surfaceTintColor: Colors.transparent,
        bottom: bottom,
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
    );
  }

  Future<void> _openSearch(BuildContext context) {
    return showSearch<void>(
      context: context,
      delegate: AppSearchDelegate(hintText: searchHint),
    );
  }
}

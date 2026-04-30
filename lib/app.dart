import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

import 'app/core/theme/app_theme.dart';
import 'app/core/values/app_constants.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class KfsGovernorateApp extends StatelessWidget {
  const KfsGovernorateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
      theme: AppTheme.lightTheme,
      defaultTransition: Transition.fadeIn,
      locale: AppConstants.defaultLocale,
      fallbackLocale: AppConstants.fallbackLocale,
      supportedLocales: AppConstants.supportedLocales,
      scrollBehavior: AppScrollBehavior(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}

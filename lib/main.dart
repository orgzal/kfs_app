import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kfs_governorate_app/app/modules/home/views/error_screen.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) =>
      ModernErrorScreen(details: details);
  // Initialize Services
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      startLocale: Locale('ar'),
      child: KfsGovernorateApp(),
    ),
  );
}

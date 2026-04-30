import 'package:get/get.dart';

import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/contact/bindings/contact_binding.dart';
import '../modules/contact/views/contact_view.dart';
import '../modules/main_shell/bindings/main_shell_binding.dart';
import '../modules/main_shell/views/main_shell_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.mainShell,
      page: () => const MainShellView(),
      binding: MainShellBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const MainShellView(),
      binding: MainShellBinding(),
    ),
    GetPage(
      name: AppRoutes.news,
      page: () => const MainShellView(),
      binding: MainShellBinding(),
    ),
    GetPage(
      name: AppRoutes.events,
      page: () => const MainShellView(),
      binding: MainShellBinding(),
    ),
    GetPage(
      name: AppRoutes.services,
      page: () => const MainShellView(),
      binding: MainShellBinding(),
    ),
    GetPage(
      name: AppRoutes.projects,
      page: () => const MainShellView(),
      binding: MainShellBinding(),
    ),
    GetPage(
      name: AppRoutes.investment,
      page: () => const MainShellView(),
      binding: MainShellBinding(),
    ),
    GetPage(
      name: AppRoutes.tourism,
      page: () => const MainShellView(),
      binding: MainShellBinding(),
    ),
    GetPage(
      name: AppRoutes.training,
      page: () => const MainShellView(),
      binding: MainShellBinding(),
    ),
    GetPage(
      name: AppRoutes.contact,
      page: () => const ContactView(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}

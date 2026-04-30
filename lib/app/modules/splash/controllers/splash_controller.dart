import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxList<String> mockItems = <String>[
    'governorate',
    'portal',
    'startup',
  ].obs;
  final RxMap<String, dynamic> mockData = <String, dynamic>{
    'version': '1.0.0',
    'environment': 'development',
  }.obs;

  @override
  void onReady() {
    super.onReady();
    _bootstrapApp();
  }

  Future<void> _bootstrapApp() async {
    await Future<void>.delayed(const Duration(seconds: 5));
    isLoading.value = false;
    Get.offAllNamed(AppRoutes.mainShell);
  }
}

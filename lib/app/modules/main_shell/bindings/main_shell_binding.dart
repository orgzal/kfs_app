import 'package:get/get.dart';

import '../../news/bindings/news_binding.dart';
import '../../home/bindings/home_binding.dart';
import '../controllers/main_shell_controller.dart';

class MainShellBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainShellController>(() => MainShellController());
    HomeBinding().dependencies();
    NewsBinding().dependencies();
  }
}

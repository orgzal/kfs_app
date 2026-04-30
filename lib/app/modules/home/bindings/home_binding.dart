import 'package:get/get.dart';

import '../../../data/repositories/home_repository.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(() => HomeRepository());
    Get.lazyPut<HomeController>(
      () => HomeController(repository: Get.find<HomeRepository>()),
    );
  }
}

import 'package:get/get.dart';

class ServicesController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<String> mockItems = <String>[
    'digital-service',
    'citizen-service',
    'business-service',
  ].obs;
  final RxMap<String, dynamic> mockData = <String, dynamic>{
    'activeCategory': 'all',
    'servicesCount': 3,
  }.obs;
}

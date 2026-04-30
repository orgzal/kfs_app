import 'package:get/get.dart';

class InvestmentController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<String> mockItems = <String>[
    'opportunity-1',
    'opportunity-2',
    'opportunity-3',
  ].obs;
  final RxMap<String, dynamic> mockData = <String, dynamic>{
    'featuredSector': 'industry',
    'opportunitiesCount': 3,
  }.obs;
}

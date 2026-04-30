import 'package:get/get.dart';

class TourismController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<String> mockItems = <String>[
    'destination-1',
    'destination-2',
    'destination-3',
  ].obs;
  final RxMap<String, dynamic> mockData = <String, dynamic>{
    'season': 'all-year',
    'featuredPlaces': 3,
  }.obs;
}

import 'package:get/get.dart';

class TrainingController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<String> mockItems = <String>[
    'program-1',
    'program-2',
    'program-3',
  ].obs;
  final RxMap<String, dynamic> mockData = <String, dynamic>{
    'activeTrack': 'general',
    'programsCount': 3,
  }.obs;
}

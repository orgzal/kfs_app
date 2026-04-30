import 'package:get/get.dart';

class EventsController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<String> mockItems = <String>[
    'event-1',
    'event-2',
    'event-3',
  ].obs;
  final RxMap<String, dynamic> mockData = <String, dynamic>{
    'upcomingCount': 3,
    'calendarEnabled': true,
  }.obs;
}

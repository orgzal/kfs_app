import 'package:get/get.dart';

class ProjectsController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<String> mockItems = <String>[
    'roadmap',
    'infrastructure',
    'community',
  ].obs;
  final RxMap<String, dynamic> mockData = <String, dynamic>{
    'status': 'draft',
    'projectsCount': 3,
  }.obs;
}

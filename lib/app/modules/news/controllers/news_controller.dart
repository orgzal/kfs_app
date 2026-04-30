import 'package:get/get.dart';

import '../../../data/models/news_model.dart';
import '../../../data/repositories/news_repository.dart';

class NewsController extends GetxController {
  NewsController({NewsRepository? repository})
      : _repository = repository ?? NewsRepository();

  final NewsRepository _repository;

  final RxBool isLoading = true.obs;
  final RxList<NewsModel> newsList = <NewsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  Future<void> fetchNews() async {
    isLoading.value = true;
    try {
      final results = await _repository.getNews();
      newsList.assignAll(results);
    } finally {
      isLoading.value = false;
    }
  }
}

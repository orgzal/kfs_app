import 'package:get/get.dart';

import '../../../data/models/banner_model.dart';
import '../../../data/models/event_model.dart';
import '../../../data/models/investment_model.dart';
import '../../../data/models/news_model.dart';
import '../../../data/models/project_model.dart';
import '../../../data/models/service_model.dart';
import '../../../data/models/statistic_model.dart';
import '../../../data/models/tourism_place_model.dart';
import '../../../data/repositories/home_repository.dart';

class HomeController extends GetxController {
  HomeController({HomeRepository? repository})
    : _repository = repository ?? HomeRepository();

  final HomeRepository _repository;
  RxString selectedType = "all".obs;

  void changeFilter(String type) {
    selectedType.value = type;
  }

  final RxBool isLoading = true.obs;
  final RxList<String> mockItems = <String>[
    'hero-slider',
    'events',
    'news',
  ].obs;
  final RxMap<String, dynamic> mockData = <String, dynamic>{
    'title': 'الرئيسية',
    'itemsCount': 10,
  }.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  final RxList<EventModel> importantEvents = <EventModel>[].obs;
  final RxList<NewsModel> latestNews = <NewsModel>[].obs;
  final RxList<ServiceModel> services = <ServiceModel>[].obs;
  final RxList<TourismPlaceModel> tourismPlaces = <TourismPlaceModel>[].obs;
  final RxList<InvestmentModel> investments = <InvestmentModel>[].obs;
  final RxList<ProjectModel> projects = <ProjectModel>[].obs;
  final RxList<StatisticModel> statistics = <StatisticModel>[].obs;
  final RxList<Map<String, String>> importantLinks = <Map<String, String>>[
    {'title': 'البوابة الرسمية', 'subtitle': 'روابط الجهات والخدمات الأساسية'},
    {'title': 'دليل المعاملات', 'subtitle': 'إجراءات ومستندات الخدمات الشائعة'},
    {
      'title': 'مركز الإعلام',
      'subtitle': 'البيانات الرسمية والتحديثات المحلية',
    },
  ].obs;
  final RxList<Map<String, String>> capitalGuide = <Map<String, String>>[
    {
      'title': 'الموقع الإداري',
      'subtitle': 'معلومات سريعة عن المدينة ومراكز الخدمة',
    },
    {'title': 'التحرك داخل العاصمة', 'subtitle': 'نقاط رئيسية وخطوط وصول مهمة'},
    {'title': 'أرقام تهمك', 'subtitle': 'جهات اتصال ومعلومات خدمية مختصرة'},
  ].obs;

  @override
  void onInit() {
    super.onInit();
    fetchHomeData();
  }

  Future<void> fetchHomeData() async {
    isLoading.value = true;

    final results = await Future.wait<dynamic>([
      _repository.getBanners(),
      _repository.getImportantEvents(),
      _repository.getFeaturedNews(),
      _repository.getQuickServices(),
      _repository.getTourismPlaces(),
      _repository.getInvestments(),
      _repository.getProjects(),
      _repository.getStatistics(),
    ]);

    banners.assignAll(results[0] as List<BannerModel>);
    importantEvents.assignAll(results[1] as List<EventModel>);
    latestNews.assignAll(results[2] as List<NewsModel>);
    services.assignAll(results[3] as List<ServiceModel>);
    tourismPlaces.assignAll(results[4] as List<TourismPlaceModel>);
    investments.assignAll(results[5] as List<InvestmentModel>);
    projects.assignAll(results[6] as List<ProjectModel>);
    statistics.assignAll(results[7] as List<StatisticModel>);

    isLoading.value = false;
  }
}

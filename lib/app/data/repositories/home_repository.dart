import '../models/banner_model.dart';
import '../models/event_model.dart';
import '../models/investment_model.dart';
import '../models/news_model.dart';
import '../models/project_model.dart';
import '../models/service_model.dart';
import '../models/statistic_model.dart';
import '../models/tourism_place_model.dart';
import '../providers/api_provider.dart';
import '../providers/local_mock_provider.dart';

class HomeRepository {
  HomeRepository({
    ApiProvider? apiProvider,
    LocalMockProvider? localMockProvider,
  })  : _apiProvider = apiProvider ?? ApiProvider(),
        _localMockProvider = localMockProvider ?? LocalMockProvider();

  final ApiProvider _apiProvider;
  final LocalMockProvider _localMockProvider;

  ApiProvider get apiProvider => _apiProvider;

  Future<List<BannerModel>> getBanners() {
    return _localMockProvider.getHomeBanners();
  }

  Future<List<StatisticModel>> getStatistics() {
    return _localMockProvider.getHomeStatistics();
  }

  Future<List<NewsModel>> getFeaturedNews() {
    return _localMockProvider.getNews();
  }

  Future<List<ServiceModel>> getQuickServices() {
    return _localMockProvider.getServices();
  }

  Future<List<EventModel>> getImportantEvents() {
    return _localMockProvider.getEvents();
  }

  Future<List<ProjectModel>> getProjects() {
    return _localMockProvider.getProjects();
  }

  Future<List<InvestmentModel>> getInvestments() {
    return _localMockProvider.getInvestments();
  }

  Future<List<TourismPlaceModel>> getTourismPlaces() {
    return _localMockProvider.getTourismPlaces();
  }
}

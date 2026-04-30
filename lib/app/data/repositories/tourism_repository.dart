import '../models/tourism_place_model.dart';
import '../providers/api_provider.dart';
import '../providers/local_mock_provider.dart';

class TourismRepository {
  TourismRepository({
    ApiProvider? apiProvider,
    LocalMockProvider? localMockProvider,
  })  : _apiProvider = apiProvider ?? ApiProvider(),
        _localMockProvider = localMockProvider ?? LocalMockProvider();

  final ApiProvider _apiProvider;
  final LocalMockProvider _localMockProvider;

  ApiProvider get apiProvider => _apiProvider;

  Future<List<TourismPlaceModel>> getTourismPlaces() {
    return _localMockProvider.getTourismPlaces();
  }
}

import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/data/repositories/location_repository.dart';

class SearchLocation {
  const SearchLocation(this.repository);

  final LocationRepository repository;

  Future<List<Location>> execute(String query) {
    return repository.searchLocation(query);
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/config/failures.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/data/repositories/location_repository.dart';
import 'package:weather_app/domain/usecases/search_location.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  Future<void> searchLocation(String? query) async {
    if (query == null || query.isEmpty) return;

    emit(LocationLoading());
    final LocationRepository weatherRepository = LocationRepository();

    final SearchLocation searchLocation = SearchLocation(weatherRepository);

    try {
      final List<Location> locations = await searchLocation.execute(query);
      emit(LocationLoaded(locations));
    } on Failure catch (failure) {
      emit(LocationError(failure.message));
    }
  }
}

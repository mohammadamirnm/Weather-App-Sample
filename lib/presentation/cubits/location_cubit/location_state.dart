part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => <Object>[];
}

class LocationInitial extends LocationState {
  const LocationInitial();
}

class LocationLoading extends LocationState {
  const LocationLoading();
}

class LocationLoaded extends LocationState {
  const LocationLoaded(this.locationResults);

  final List<Location> locationResults;

  @override
  List<Object> get props => <Location>[...locationResults];
}

class LocationError extends LocationState {
  const LocationError(this.message);

  final String message;

  @override
  List<Object> get props => <String>[message];
}

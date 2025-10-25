part of 'location_cubit.dart';

sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationLoaded extends LocationState {
  final Location location;

  LocationLoaded({required this.location});
}

final class LocationError extends LocationState {
  final String message;

  LocationError({required this.message});
}

import 'package:bloc/bloc.dart';
import 'package:weather_app/domain/entity/location.dart';
import 'package:weather_app/domain/repository/location_repository.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepository locationRepository;

  LocationCubit({required this.locationRepository}) : super(LocationInitial());

  Future<void> getLocation() async {
    emit(LocationLoading());
    try {
      final location = await locationRepository.getCurrentLocation();
      emit(LocationLoaded(location: location));
    } catch (e) {
      emit(LocationError(message: e.toString()));
    }
  }
}

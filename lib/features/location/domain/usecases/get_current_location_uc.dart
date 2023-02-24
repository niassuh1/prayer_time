import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:prayer_time/core/error/failure.dart';
import 'package:prayer_time/features/location/domain/repostistory/location_repostiory.dart';

class GetCurrentLocationUsecase {
  final LocationRepostiory locationRepostiory;
  GetCurrentLocationUsecase(this.locationRepostiory);

  Future<Either<Failure, Placemark>> call() async {
    return await locationRepostiory.getCurrentLocation();
  }
}

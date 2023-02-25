
import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:prayer_time/core/error/failure.dart';
import 'package:prayer_time/features/location/domain/repostistory/location_repostiory.dart';

class GetPrefferedCityUsecase {
  final LocationRepostiory locationRepostiory;
  GetPrefferedCityUsecase(this.locationRepostiory);

  Future<Either<Failure, Placemark>> call() async {
    return await locationRepostiory.getPreferredCity();
  }
}

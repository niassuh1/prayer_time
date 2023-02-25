import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:prayer_time/core/error/failure.dart';
import 'package:prayer_time/features/location/domain/repostistory/location_repostiory.dart';

class GetFavoriteCitiesUsecase {
  final LocationRepostiory locationRepostiory;
  GetFavoriteCitiesUsecase(this.locationRepostiory);

  Future<Either<Failure, List<String>>> call() async {
    return await locationRepostiory.getFavoriteCities();
  }
}

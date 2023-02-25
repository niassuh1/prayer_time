import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:prayer_time/core/error/failure.dart';
import 'package:prayer_time/features/location/domain/repostistory/location_repostiory.dart';

class RemoveFavoriteCityUsecase {
  final LocationRepostiory locationRepostiory;
  RemoveFavoriteCityUsecase(this.locationRepostiory);

  Future<Either<Failure, void>> call(String city) async {
    return await locationRepostiory.removeFavoriteCity(city);
  }
}

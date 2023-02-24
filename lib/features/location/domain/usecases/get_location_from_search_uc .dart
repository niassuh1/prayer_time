import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:prayer_time/core/error/failure.dart';
import 'package:prayer_time/features/location/domain/repostistory/location_repostiory.dart';

class GetLocationFromSearch {
  final LocationRepostiory locationRepostiory;
  GetLocationFromSearch(this.locationRepostiory);

  Future<Either<Failure, Location>> call(String query) async {
    return await locationRepostiory.getLocationFromSearch(query);
  }
}

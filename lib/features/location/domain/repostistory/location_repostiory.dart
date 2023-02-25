import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:prayer_time/core/error/failure.dart';

abstract class LocationRepostiory {
  Future<Either<Failure, Placemark>> getPreferredCity();
  Future<Either<Failure, void>> setPreferredCity(String city);
  Future<Either<Failure, Location>> getLocationFromSearch(String query);
  Future<Either<Failure, void>> saveFavoriteCity(String city);
  Future<Either<Failure, void>> removeFavoriteCity(String city);
  Future<Either<Failure, List<String>>> getFavoriteCities();
}

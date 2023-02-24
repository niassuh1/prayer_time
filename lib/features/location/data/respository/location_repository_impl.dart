import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:prayer_time/core/error/exception.dart';
import 'package:prayer_time/core/error/failure.dart';
import 'package:geocoding_platform_interface/src/models/placemark.dart';
import 'package:dartz/dartz.dart';
import 'package:prayer_time/features/location/data/datasource/location_local_datasource.dart';
import 'package:prayer_time/features/location/domain/repostistory/location_repostiory.dart';

class LocationRepositoryImpl extends LocationRepostiory {
  final LocationLocalDatasource localDatasource;

  LocationRepositoryImpl({required this.localDatasource});

  @override
  Future<Either<Failure, Placemark>> getCurrentLocation() async {
    try {
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();

      Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
      List<Placemark> placemarks = await placemarkFromCoordinates(currentPosition.latitude, currentPosition.longitude);
      return Right(placemarks[0]);
    } on LocationPermissionException {
      return Left(LocationPermissionFailure());
    }
  }

  @override
  Future<Either<Failure, Location>> getLocationFromSearch(String query) async {
    try {
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();

      Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
      List<Location> location = await locationFromAddress(query);
      return Right(location[0]);
    } on LocationPermissionException {
      return Left(LocationPermissionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveFavoriteCity(String city) async {
    try {
      localDatasource.storeFavoriteCity(city);
      return Right(Unit);
    } catch (e) {
      return Left(LocalStorageFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getFavoriteCities() async {
    try {
      List<String> cities = await localDatasource.getFavoriteCities();
      return Right(cities);
    } catch (e) {
      return Left(LocalStorageFailure());
    }
  }
}

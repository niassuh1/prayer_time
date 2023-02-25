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

  @override
  Future<Either<Failure, void>> removeFavoriteCity(String city) async {
    try {
      await localDatasource.removeFavoriteCity(city);
      return Right(Unit);
    } catch (e) {
      return Left(LocalStorageFailure());
    }
  }

  @override
  Future<Either<Failure, Placemark>> getPreferredCity() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission.index == 0) {
        await Geolocator.requestPermission();
      }
      String? preferredCity = await localDatasource.getPreferredCity();

      if (preferredCity != null) {
        Location location = (await locationFromAddress(preferredCity))[0];
        Placemark placemark = (await placemarkFromCoordinates(location.latitude, location.longitude))[0];
        return Right(placemark);
      }

      Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
      Placemark placemark = (await placemarkFromCoordinates(currentPosition.latitude, currentPosition.longitude))[0];
      await localDatasource.setPreferredCity(placemark.subAdministrativeArea!);
      return Right(placemark);
    } on LocationPermissionException {
      return Left(LocationPermissionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> setPreferredCity(String city) async {
    try {
      await localDatasource.setPreferredCity(city);
      return Right(Unit);
    } catch (e) {
      return Left(LocalStorageFailure());
    }
  }
}

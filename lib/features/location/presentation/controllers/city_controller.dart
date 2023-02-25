import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:prayer_time/core/error/failure.dart';
import 'package:prayer_time/features/location/data/datasource/location_local_datasource.dart';
import 'package:prayer_time/features/location/data/respository/location_repository_impl.dart';
import 'package:prayer_time/features/location/domain/repostistory/location_repostiory.dart';
import 'package:prayer_time/features/location/domain/usecases/get_favorite_cities_uc.dart';
import 'package:prayer_time/features/location/domain/usecases/get_preffered_city_uc.dart';
import 'package:prayer_time/features/location/domain/usecases/remove_favorite_location%20_uc.dart';
import 'package:prayer_time/features/location/domain/usecases/save_favorite_location_uc.dart';
import 'package:prayer_time/features/location/domain/usecases/set_preffered_city_uc.dart';

Future<void> saveFavoriteCity(String city) async {
  LocationLocalDatasource localDatasource = LocationLocalDatasourceImpl();
  LocationRepostiory repostiory = LocationRepositoryImpl(localDatasource: localDatasource);
  await SaveFavoriteCityUsecase(repostiory)(city);
}

Future<void> removeFavoriteCity(String city) async {
  LocationLocalDatasource localDatasource = LocationLocalDatasourceImpl();
  LocationRepostiory repostiory = LocationRepositoryImpl(localDatasource: localDatasource);
  await RemoveFavoriteCityUsecase(repostiory)(city);
}

Future<Either<Failure, Placemark>> getPreferredCity() async {
  LocationLocalDatasource localDatasource = LocationLocalDatasourceImpl();
  LocationRepostiory repostiory = LocationRepositoryImpl(localDatasource: localDatasource);
  var currentLocation = await GetPrefferedCityUsecase(repostiory)();

  return currentLocation;
}

Future<void> setPreferredCity(String city) async {
  LocationLocalDatasource localDatasource = LocationLocalDatasourceImpl();
  LocationRepostiory repostiory = LocationRepositoryImpl(localDatasource: localDatasource);
  await SetPrefferedCityUsecase(repostiory)(city);
}

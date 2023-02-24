import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:prayer_time/core/error/failure.dart';
import 'package:prayer_time/features/location/data/datasource/location_local_datasource.dart';
import 'package:prayer_time/features/location/data/respository/location_repository_impl.dart';
import 'package:prayer_time/features/location/domain/repostistory/location_repostiory.dart';

final locationMenuProvider = FutureProvider<Either<Failure, Placemark>>((ref) async {
  LocationLocalDatasource _localDatasource = LocationLocalDatasourceImpl();
  LocationRepostiory repostiory = LocationRepositoryImpl(localDatasource: _localDatasource);
  var currentLocation = await repostiory.getCurrentLocation();
  return currentLocation;
});

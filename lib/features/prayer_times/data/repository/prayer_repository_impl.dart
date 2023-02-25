import 'package:prayer_time/core/error/exception.dart';
import 'package:prayer_time/features/prayer_times/data/datasource/prayer_remote_datasource.dart';
import 'package:prayer_time/features/prayer_times/domain/entites/prayer_timing.dart';
import 'package:prayer_time/features/prayer_times/domain/entites/prayer_method.dart';
import 'package:prayer_time/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:prayer_time/features/prayer_times/domain/repository/prayer_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class PrayerRepositoryImpl implements PrayerRepository {
  final PrayerRemoteDatasource prayerRemoteDatasource;
  final InternetConnectionChecker internetConnectionChecker;
  PrayerRepositoryImpl({required this.prayerRemoteDatasource, required this.internetConnectionChecker});
  @override
  Future<Either<Failure, PrayerTiming>> getPrayerTime(String city, DateTime date, PrayerMethod method) async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        PrayerTiming prayerTiming = await prayerRemoteDatasource.getPrayerTime(city, date, method);
        return Right(prayerTiming);
      } on InternetConnectionException {
        return Left(InternetConnectionFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }
}

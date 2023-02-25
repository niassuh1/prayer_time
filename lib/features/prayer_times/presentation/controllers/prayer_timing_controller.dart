import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:prayer_time/core/api/prayer_api.dart';
import 'package:prayer_time/core/error/failure.dart';
import 'package:prayer_time/core/local_hive_boxes.dart';
import 'package:prayer_time/features/prayer_times/data/datasource/prayer_remote_datasource.dart';
import 'package:prayer_time/features/prayer_times/data/repository/prayer_repository_impl.dart';
import 'package:prayer_time/features/prayer_times/domain/entites/prayer_method.dart';
import 'package:prayer_time/features/prayer_times/domain/entites/prayer_timing.dart';
import 'package:prayer_time/features/prayer_times/domain/usecase/get_prayer_times_uc.dart';
import 'package:prayer_time/features/prayer_times/presentation/controllers/date_time_controller.dart';

class PrayerTimingProviderParams extends Equatable {
  final String cityName;
  final DateTime date;
  PrayerTimingProviderParams({required this.cityName, required this.date});

  @override
  List<Object?> get props => [cityName, date];
}

final prayerTimingProvider = FutureProvider.family<Either<Failure, PrayerTiming>, String>((ref, arg) async {
  PrayerRepositoryImpl prayerRepository = PrayerRepositoryImpl(
    internetConnectionChecker: InternetConnectionChecker(),
    prayerRemoteDatasource: PrayerRemoteDatasourceImpl(
      PrayerApi(),
    ),
  );
  var prayerTimes =
      await GetPrayerTimesUsecase(prayerRepository)(arg, ref.watch(dateTimeProvider), PrayerMethod.turkey);
  return prayerTimes;
});

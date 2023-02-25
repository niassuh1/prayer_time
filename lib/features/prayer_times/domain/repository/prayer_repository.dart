import 'package:dartz/dartz.dart';
import 'package:prayer_time/core/error/failure.dart';
import 'package:prayer_time/features/prayer_times/domain/entites/prayer_method.dart';
import 'package:prayer_time/features/prayer_times/domain/entites/prayer_timing.dart';

abstract class PrayerRepository {
  Future<Either<Failure, List<PrayerTiming>>> getPrayerTimes(String city, DateTime date, PrayerMethod method);
}

import 'package:dartz/dartz.dart';
import 'package:prayer_time/core/error/failure.dart';
import 'package:prayer_time/features/prayer_times/domain/entites/prayer_method.dart';
import 'package:prayer_time/features/prayer_times/domain/entites/prayer_timing.dart';
import 'package:prayer_time/features/prayer_times/domain/repository/prayer_repository.dart';

class GetPrayerTimesUsecase {
  PrayerRepository prayerRepository;
  GetPrayerTimesUsecase(this.prayerRepository);

  Future<Either<Failure, PrayerTiming>> call(String city, DateTime date, PrayerMethod method) async {
    return await prayerRepository.getPrayerTime(city, date, method);
  }
}

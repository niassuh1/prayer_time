import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prayer_time/features/prayer_times/domain/entites/prayer_timing.dart';

part 'prayer_timing_model.freezed.dart';
part 'prayer_timing_model.g.dart';

@freezed
class PrayerTimingModel extends PrayerTiming with _$PrayerTimingModel {
  const factory PrayerTimingModel(
      {required String Fajr,
      required String Sunrise,
      required String Dhuhr,
      required String Asr,
      required String Sunset,
      required String Maghrib,
      required String Isha,
      required String Imsak,
      required String Midnight}) = _PrayerTimingModel;

  factory PrayerTimingModel.fromJson(Map<String, Object?> json) => _$PrayerTimingModelFromJson(json);
}

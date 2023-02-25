import 'package:equatable/equatable.dart';

class PrayerTiming extends Equatable {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;
  final String imsak;
  final String midnight;

  const PrayerTiming(
      {required this.fajr,
      required this.sunrise,
      required this.dhuhr,
      required this.asr,
      required this.sunset,
      required this.maghrib,
      required this.isha,
      required this.imsak,
      required this.midnight});

  @override
  List<Object?> get props => [fajr, sunrise, dhuhr, asr, sunset, maghrib, isha, imsak, midnight];
}

import 'package:equatable/equatable.dart';

class PrayerTiming {
  final String Fajr;
  final String Sunrise;
  final String Dhuhr;
  final String Asr;
  final String Sunset;
  final String Maghrib;
  final String Isha;
  final String Imsak;
  final String Midnight;

  const PrayerTiming(
      {required this.Fajr,
      required this.Sunrise,
      required this.Dhuhr,
      required this.Asr,
      required this.Sunset,
      required this.Maghrib,
      required this.Isha,
      required this.Imsak,
      required this.Midnight});
}

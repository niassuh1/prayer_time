import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
import 'package:prayer_time/core/api/http_requests.dart';
import 'package:prayer_time/core/local_hive_boxes.dart';
import 'package:prayer_time/features/prayer_times/data/models/prayer_timing_model.dart';
import 'package:prayer_time/features/prayer_times/domain/entites/prayer_method.dart';

abstract class PrayerRemoteDatasource {
  PrayerRemoteDatasource();
  Future<PrayerTimingModel> getPrayerTime(String city, DateTime date, PrayerMethod method);
}

class PrayerRemoteDatasourceImpl implements PrayerRemoteDatasource {
  final HTTPRequests api;
  PrayerRemoteDatasourceImpl(this.api) : super();

  @override
  Future<PrayerTimingModel> getPrayerTime(String city, DateTime date, PrayerMethod method) async {
    final response = await api.getFromQuery('/calendarByCity/${date.year}/${date.month}',
        {'city': Hive.box(LocalHiveBoxes.PREFERRED_CITY).get('city'), 'country': 'Saudi Arabia'});

    var decodedJson = json.decode(response.body);

    PrayerTimingModel prayerTimings = PrayerTimingModel.fromJson(decodedJson['data'][0]['timings']);
    return prayerTimings;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:prayer_time/core/local_hive_boxes.dart';
import 'package:prayer_time/features/prayer_times/presentation/controllers/prayer_timing_controller.dart';
import 'package:prayer_time/features/prayer_times/presentation/widgets/prayer_time_panel.dart';

class PrayerTimeWidget extends ConsumerWidget {
  const PrayerTimeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prayerTimes = ref.watch(prayerTimingProvider(Hive.box(LocalHiveBoxes.PREFERRED_CITY).get('city')));
    return prayerTimes.when(
      data: (data) => data.fold(
        (fail) => Text('Fail'),
        (prayerTiming) => Column(children: [
          PrayerTimePanel(prayer: 'Fajr', time: prayerTiming.Fajr),
          PrayerTimePanel(prayer: 'Sunrise', time: prayerTiming.Sunrise),
          PrayerTimePanel(prayer: 'Dhuhr', time: prayerTiming.Dhuhr),
          PrayerTimePanel(prayer: 'Asr', time: prayerTiming.Asr),
          PrayerTimePanel(prayer: 'Sunset', time: prayerTiming.Sunset),
          PrayerTimePanel(prayer: 'Maghrib', time: prayerTiming.Maghrib),
          PrayerTimePanel(prayer: 'Isha', time: prayerTiming.Isha),
        ]),
      ),
      error: (error, stackTrace) {
        print(error);
        return Text('error');
      },
      loading: () => Text('Loading'),
    );
  }
}

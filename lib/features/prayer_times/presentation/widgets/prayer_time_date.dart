import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_time/core/layout/app_text_theme.dart';
import 'package:prayer_time/features/prayer_times/presentation/controllers/date_time_controller.dart';

class PrayerTimeDate extends ConsumerWidget {
  const PrayerTimeDate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              var date = ref.watch(dateTimeProvider);
              ref.read(dateTimeProvider.notifier).state = DateTime(date.year, date.month - 1, date.day);
            },
            icon: Icon(Icons.chevron_left)),
        GestureDetector(
          onDoubleTap: () {
            ref.read(dateTimeProvider.notifier).state = DateTime.now();
          },
          child: Column(
            children: [
              Text(
                getMonth(ref.watch(dateTimeProvider).month),
                style: AppTextTheme.h3!.copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                ref.watch(dateTimeProvider).year.toString(),
                style: AppTextTheme.bodyLarge,
              ),
            ],
          ),
        ),
        IconButton(
            onPressed: () {
              var date = ref.watch(dateTimeProvider);
              ref.read(dateTimeProvider.notifier).state = DateTime(date.year, date.month + 1, date.day);
            },
            icon: Icon(Icons.chevron_right)),
      ],
    );
  }
}

String getMonth(int index) {
  switch (index) {
    case 1:
      return 'January';
    case 2:
      return 'February';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    case 12:
      return 'December';
    default:
      return 'January';
  }
}

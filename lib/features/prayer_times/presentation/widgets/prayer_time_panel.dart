import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_time/core/layout/app_spacing.dart';
import 'package:prayer_time/core/layout/app_text_theme.dart';
import 'package:prayer_time/features/notify_prayer/presentation/widgets/notification_button.dart';

class PrayerTimePanel extends ConsumerWidget {
  final String prayer;
  final String time;
  const PrayerTimePanel({super.key, required this.prayer, required this.time});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(4)),
      child: Row(children: [
        Text(prayer, style: AppTextTheme.h4!.copyWith(fontWeight: FontWeight.w600)),
        Spacer(),
        Text(time),
        AppSpacing.kHorizontal4,
        NotificationButton(
          prayer: prayer,
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:prayer_time/features/notify_prayer/domain/entities/local_notification.dart';
import 'package:prayer_time/features/prayer_times/domain/entites/prayer_timing.dart';

class NotificationButton extends StatelessWidget {
  String prayer;
  NotificationButton({super.key, required this.prayer});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await LocalNotification.init();
        await LocalNotification.showNotification('fasdf', 'sdafasdf');
      },
      splashRadius: 16,
      icon: Icon(Icons.notifications_none),
    );
  }
}

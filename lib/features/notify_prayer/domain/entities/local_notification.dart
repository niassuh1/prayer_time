import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  static final _notification = FlutterLocalNotificationsPlugin();

  static Future<bool?> init() async {
    var androidInit = new AndroidInitializationSettings('');
    return await _notification.initialize(InitializationSettings(android: androidInit));
  }

  static Future<NotificationDetails> _notificationDetails() async {
    return await NotificationDetails(
      android: AndroidNotificationDetails('0', 'name', channelDescription: '', importance: Importance.high),
      iOS: DarwinNotificationDetails(),
    );
  }

  static Future<void> showNotification(String title, String body) async {
    if ((await init())!) {
      await _notification.show(0, title, body, await _notificationDetails());
    }
  }
}

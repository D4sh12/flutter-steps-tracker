import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final localNotificationProvider = Provider<FlutterLocalNotificationsPlugin>(
    (ref) => FlutterLocalNotificationsPlugin());

final localNotificationServiceProvier = Provider((ref) =>
    LocalNotificationService(
        flutterLocalNotificationsPlugin: ref.watch(localNotificationProvider)));

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  LocalNotificationService({required this.flutterLocalNotificationsPlugin});
  Future<void> setup() async {
    const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');

    const initSettings = InitializationSettings(android: androidSetting);

    await flutterLocalNotificationsPlugin.initialize(initSettings).then((_) {
      debugPrint('[NOTIFICATIONS PLUGIN] setup success');
    }).catchError((Object error) {
      debugPrint('[NOTIFICATIONS PLUGIN] Error: $error');
    });
  }

  Future<void> addNotification({
    required String title,
    required String body,
    required String channel,
  }) async {
    final androidDetail = AndroidNotificationDetails(
      channel, // channel Id
      channel, // channel Name
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      ticker: 'ticker',
      color: const Color(0xff2196f3),
    );

    final noticeDetail = NotificationDetails(
      android: androidDetail,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      noticeDetail,
    );
  }
}

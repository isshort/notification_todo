// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  LocalNotificationService();
//ic_notification.png

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const androidInitializationSettings =
        AndroidInitializationSettings('@drawable/ic_launch_image');

    final iosInitializationSettings = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );

    final settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );
    await _localNotificationService.initialize(
      settings,
      onSelectNotification: onSelectNotification,
    );
  }

  Future<NotificationDetails> _notificationDetails() async {
    const androidNotificationDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      channelDescription: 'description ',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
    );
    const iosNotificationDetails = IOSNotificationDetails();

    return const NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await _notificationDetails();
    await _localNotificationService.show(id, title, body, details);
  }

  void _onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) {
    print('id $id');
  }

  void onSelectNotification(String? payload) {
    print('payload $payload');
  }
}

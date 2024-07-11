import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:timezone/timezone.dart' as tz;


class NotificationService{

  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> onDidReceiveNotification(NotificationResponse notificationResponse) async{

  }

  static Future<void> init() async{

    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings("@mipmap/ic_launcher");

    const DarwinInitializationSettings darwinInitializationSettings = DarwinInitializationSettings();


    const InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotification,
      onDidReceiveBackgroundNotificationResponse: onDidReceiveNotification,
    );

    await _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  }

  static Future<void> showInstantNotification(String title , String body) async
  {
    const NotificationDetails platformChannelSpecifies = NotificationDetails(
      android: AndroidNotificationDetails("channel_Id", "channel_Name",
      importance: Importance.high,
      priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails()
    );

    await _flutterLocalNotificationsPlugin.show(0, title, body, platformChannelSpecifies);

  }

  static Future<void> scheduleNotification(String title , String body , DateTime scheduledDate) async
  {
    const NotificationDetails platformChannelSpecifies = NotificationDetails(
      android: AndroidNotificationDetails("channel_Id", "channel_Name",
      importance: Importance.high,
      priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails()
    );

    await _flutterLocalNotificationsPlugin.zonedSchedule(0, title, body, tz.TZDateTime.from(scheduledDate, tz.local),platformChannelSpecifies,
     uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
     matchDateTimeComponents: DateTimeComponents.dateAndTime
     
     );

  }
}
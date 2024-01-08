import 'dart:async';
import 'dart:developer';
import 'dart:io' as io;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'abstract/base_notification_service.dart';

class FirebaseNotificationService extends BaseNotificationService {
  final Function()? afterGetTokenFunction;

  FirebaseNotificationService({
    this.afterGetTokenFunction,
  });

  @override
  Future<void> init() async {
    await askNotificationPermission();
    await _createAndroidNotificationChannel();
    await _showForegroundNotificationOnNotificationCenter();
    listenForegroundMessages();

    await getToken.then((token) async {
      log(token.toString(), name: "FCM Token");
      afterGetTokenFunction?.call();
    });
  }

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<String?> get getToken async => await _firebaseMessaging.getToken();

  @override
  Future askNotificationPermission() async {
    try {
      NotificationSettings settings =
          await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: false,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      log(settings.authorizationStatus.toString(),
          name: "FCM Notification Permission Status");
    } catch (e) {
      log(e.toString(), name: 'askNotificationPermission()');
    }
  }

//* messages

  @override
  void listenForegroundMessages() {
    try {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//* android
        RemoteNotification? remoteNotification = message.notification;
        Map<String, dynamic> remoteNotificationData = message.data;
        AndroidNotification? androidNotification =
            message.notification?.android;

        if (io.Platform.isIOS) {
          log("Title: ${message.notification?.title} Body: ${message.notification?.body} Data: ${message.data['data']}");
        } else if (io.Platform.isAndroid) {
          if (remoteNotification != null && androidNotification != null) {
            _flutterLocalNotificationsPlugin.show(
                remoteNotification.hashCode,
                remoteNotification.title,
                remoteNotification.body,
                NotificationDetails(
                    android: AndroidNotificationDetails(
                        _channel.id, _channel.name,
                        channelDescription: _channel.description,
                        icon: androidNotification.smallIcon)));
            log("Title: ${remoteNotification.title} Body: ${remoteNotification.body} Data: ${remoteNotificationData['data']}");
          }
        }
      });
    } catch (e) {
      log(e.toString(), name: 'listenForegroundMessages()');
    }
  }

//* for ios
  Future<void> _showForegroundNotificationOnNotificationCenter() async {
    try {
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    } catch (e) {
      log(e.toString(),
          name: '_showForegroundNotificationOnNotificationCenter()');
    }
  }

//* for android
  final AndroidNotificationChannel _channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
      enableLights: true,
      enableVibration: true,
      playSound: true);

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> _createAndroidNotificationChannel() async {
    try {
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(_channel);
    } catch (e) {
      log(e.toString(), name: '_createAndroidNotificationChannel()');
    }
  }
}

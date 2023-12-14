import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';


var fcmToken;

Future<void> handelBackgroundNotification(RemoteMessage message) async {
  log('TITLE: ${message}');
  log('Body: ${message.notification?.body}');
  log('Payload: ${message.data['body']}');
}

class FirebaseApi {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future<void> initNotification() async {
    await messaging.requestPermission();
    fcmToken =  await messaging.getToken();
    print("this is the fcm token generated $fcmToken");
    initpushNOtificationIos();
  }

  void handelMsg(RemoteMessage? msg) {
    if (msg?.data['type'] == 'Events') return;
    // navigatorKey.currentState
    //     ?.pushNamed(StudentsViewEvents.route, arguments: msg);
  }

// For ios mobile application
  Future initpushNOtificationIos() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    //to open the app using notification
    FirebaseMessaging.instance.getInitialMessage().then(handelMsg);
    //to open app from notificaion when running in background
    FirebaseMessaging.onMessageOpenedApp.listen(handelMsg);
    //
    FirebaseMessaging.onBackgroundMessage(handelBackgroundNotification);
  }
}

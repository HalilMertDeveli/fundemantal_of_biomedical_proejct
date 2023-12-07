import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var andoridInitialize =
        new AndroidInitializationSettings("mipmap/ic_launcher");
    var iosInitialize = new DarwinInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: andoridInitialize, iOS: iosInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future showBigTextNotifaction(
      {var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidNotifcationChanelSpecifics =
        new AndroidNotificationDetails(
      'you_can_name_id',
      "Channel name",
      //playSound: true,
      //sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.high,
      priority: Priority.high,
    );
      var not = NotificationDetails(android: androidNotifcationChanelSpecifics,iOS: DarwinNotificationDetails());

    await fln.show(0, title, body, not);


  }
}

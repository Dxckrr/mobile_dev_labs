import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationService {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initializeNotifications() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: true,
      sound: true,
    );
    final fcmToken = await _firebaseMessaging.getToken();
    print("FCM Token : $fcmToken");
  }
}

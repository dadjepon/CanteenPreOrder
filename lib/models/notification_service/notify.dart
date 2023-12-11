import 'dart:html' as web;

Future<void> showNotification(String message) async {
  var permission = web.Notification.permission;
  if (permission != 'granted') {
    permission = await web.Notification.requestPermission();
  }
  if (permission == 'granted') {
    web.Notification(message);
  }
}

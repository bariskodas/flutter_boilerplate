abstract class BaseNotificationService {
  BaseNotificationService();

  Future init();
  Future askNotificationPermission();
  listenForegroundMessages();
}

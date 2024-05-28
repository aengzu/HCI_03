import 'package:get/get.dart';
import 'package:hci_03/models/notification.dart';
import 'package:hci_03/service/notification_service.dart';

// NOTE: 현재 서버 기능 미구현 상태
class NotificationController extends GetxController {
  var isLoading = false.obs;
  var notifications = <Notification>[].obs;
  var errorMessage = ''.obs;

  final NotificationService notificationService = NotificationService();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchNotifications(String memberId) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      notifications.value = await notificationService.getNotifications(memberId);
    } catch (e) {
      errorMessage.value = 'Failed to load notifications: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> sendNotification(String memberId, String message) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      await notificationService.sendNotification(memberId, message);
      await fetchNotifications(memberId); // 새로 알림을 보낸 후 알림 목록을 새로고침
    } catch (e) {
      errorMessage.value = 'Failed to send notification: $e';
    } finally {
      isLoading.value = false;
    }
  }
}

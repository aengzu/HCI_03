import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationController notificationController = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Obx(() {
        if (notificationController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (notificationController.errorMessage.value.isNotEmpty) {
          return Center(child: Text(notificationController.errorMessage.value));
        } else {
          return ListView.builder(
            itemCount: notificationController.notifications.length,
            itemBuilder: (context, index) {
              final notification = notificationController.notifications[index];
              return ListTile(
                title: Text(notification.message),
                subtitle: Text(notification.timestamp.toLocal().toString()),
                trailing: Icon(Icons.notifications, color: Colors.red),
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      title: Text('대결 신청'),
                      content: Text(notification.message),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // 수락하기 로직 추가
                            Get.back(); // 팝업 닫기
                          },
                          child: Text('수락하기', style: TextStyle(color: Colors.green)),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back(); // 팝업 닫기
                          },
                          child: Text('취소', style: TextStyle(color: Colors.grey)),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        }
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/image_assets.dart';
import '../../controllers/user_controller.dart';
import '../components/appbar_preffered_size.dart';
import 'components/user_widget.dart';

// class MyPageScreen extends StatelessWidget {
//   MyPageScreen({super.key});
//   final userListController = Get.put(UserController());

//   Widget loading() {
//     return const Center(
//       child: CircularProgressIndicator(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Image.asset(ImageAssets.logo, width: 100),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.settings), // 설정 아이콘
//             onPressed: () {}, // 아이콘 버튼 클릭 이벤트 처리
//           ),
//         ],
//         bottom: appBarBottomLine(),
//       ),
//       body: GetX<UserController>(
//         builder: (_) {
//           if (userListController.loading == true) {
//             return loading();
//           } else {
//             return UserWidget(
//               user: userListController.userDataList[0],
//             );
//           }
//         },
//         initState: (_) {
//           userListController.loadUser(); // 페이지가 초기화될 때 사용자 정보를 자동으로 로드
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../../constants/image_assets.dart';
import '../../constants/theme.dart';
import '../components/appbar_preffered_size.dart';
import '../components/custom_btn.dart';

class FriendScreen extends StatelessWidget {
  const FriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Image.asset(ImageAssets.logo, width: 100),
    actions: [
    IconButton(
    icon: Icon(Icons.settings), // 설정 아이콘
    onPressed: () {}, // 아이콘 버튼 클릭 이벤트 처리
    ),],
          bottom: appBarBottomLine(),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(label: '버튼 테스트용', onPressed: (){},),
              Text('텍스트 테스트 : 제작 시 삭제'),

              Text('displayLarge', style: textTheme().displayLarge),
              Text('titleMedium', style: textTheme().titleMedium),
              Text('bodyLarge', style: textTheme().bodyLarge),
              Text('기본 글꼴'),


            ],
          ),
        )
    );
  }
}

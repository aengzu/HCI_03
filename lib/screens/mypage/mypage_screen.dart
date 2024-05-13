import 'package:flutter/material.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/models/request_title.dart';
import 'package:hci_03/screens/components/custom_btn.dart';
import 'package:hci_03/screens/components/custom_light_btn.dart';
import 'package:hci_03/screens/components/grey_btn.dart';
import 'package:hci_03/screens/components/notice_box.dart';
import 'package:hci_03/screens/components/small_btn.dart';
import 'package:hci_03/screens/components/small_grey_btn.dart';

import '../../constants/image_assets.dart';
import '../components/appbar_preffered_size.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

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
          bottom: appBarBottomLine(),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // NOTE: notice box - 상단에 띄우는 공지 박스, tile 과 description 입력
             // NoticeBox(notice: Notice(title: '공지 📣', description: '공지 des')),
              NoticeBox(notice: dummyNotices[0]), // <- dummyNotices 로도 사용 가능
              SizedBox(height: 10,),
              // NOTE: small 비활성화 버튼
              SmallGreyButton(label: 'small', onPressed: (){}),
              SizedBox(height: 10,),
              // NOTE: small 활성화 버튼
              SmallButton(label: 'small', onPressed: (){}),
              SizedBox(height: 10,),
              // NOTE: 비활성화 버튼
              GreyButton(label: 'grey 버튼 테스트', onPressed: (){}),
              SizedBox(height: 10,),
              // NOTE: 기본 버튼
              CustomButton(label: 'basic 버튼 테스트용', onPressed: (){},),
              SizedBox(height: 10,),
              // NOTE: 연한 버튼
              CustomButtonLight(label: 'light 버튼 테스트용', onPressed: (){},),
              // NOTE: tilteLarge 큰 볼드체
              Text('titleLarge, 대결 진행상황', style: textTheme().titleLarge),
              // NOTE: tileMedium 중간 볼드체
              Text('titleMedium', style: textTheme().titleMedium),
              // NOTE: titleSmall 작은 볼드체
              Text('titleSmall, 모든 친구 목록', style: textTheme().titleSmall),
              // NOTE: bodyLarge 큰 일반체 (태스크 이거로 작성 혹은
              Text('bodyLarge, 성수님이 대결 신청', style: textTheme().bodyLarge),
              // NOTE: bodyMedium 중간 일반체
              Text('bodyMedium, 비타민 먹기 💊', style: textTheme().bodyMedium),
              // NOTE: bodySmall 작은 일반체
              Text('bodySmall, 상대방의 도전에 응하시겠습니까?', style: textTheme().bodySmall),
            ],
          ),
        )
    );
  }
}

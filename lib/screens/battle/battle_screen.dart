import 'package:flutter/material.dart';

import '../../constants/image_assets.dart';
import '../components/appbar_preffered_size.dart';

class BattleScreen extends StatelessWidget {
  const BattleScreen({super.key});

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
        body: const Center(
          child: Text('대결 진행 상황'),
        )
    );
  }
}

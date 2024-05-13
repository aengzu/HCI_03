import 'package:flutter/material.dart';
import 'package:hci_03/models/request_title.dart';
import 'package:hci_03/screens/battle_request/components/notice_box.dart';

import '../../constants/image_assets.dart';
import '../components/appbar_preffered_size.dart';
class BattleRequestScreen extends StatelessWidget {
  const BattleRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(ImageAssets.logo, width: 100),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: NoticeBox(notice:dummyNotices[0]),
          ),
        ],
      ),
    );
  }
}

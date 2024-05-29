import 'package:flutter/material.dart';
import 'package:hci_03/constants/theme.dart'; // textTheme import
import '../../constants/image_assets.dart';
import '../components/appbar_preffered_size.dart';
import 'package:hci_03/models/request_title.dart';
import 'package:hci_03/screens/battle/components/promise_widget.dart'; // PromiseWidget import
import 'package:hci_03/screens/calendar/dummy.dart'; // dummy.dart import
import 'package:hci_03/screens/battle/components/complete_widget.dart'; // CompleteWidget import

class BattleCompleteScreen extends StatefulWidget {
  const BattleCompleteScreen({super.key});

  @override
  _BattleCompleteScreenState createState() => _BattleCompleteScreenState();
}

class _BattleCompleteScreenState extends State<BattleCompleteScreen> {
  late DateTime _currentFocusedDay;
  DateTime? _currentSelectedDay;

  bool _isProfileClicked = false;
  double _myPercentage = 75.0;
  double _gildongPercentage = 65.0;

  void _handleProfileClick() {
    setState(() {
      _isProfileClicked = !_isProfileClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(ImageAssets.logo, width: 100),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // 설정 버튼 클릭 시 동작 정의
            },
          ),
        ],
        bottom: appBarBottomLine(), // AppBar 하단의 선
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          children: [
            CompleteWidget(
              isProfileClicked: _isProfileClicked,
              myPercentage: _myPercentage,
              gildongPercentage: _gildongPercentage,
              onClickProfile: _handleProfileClick,
            ), // CompleteWidget 사용
            const SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Center(
                  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

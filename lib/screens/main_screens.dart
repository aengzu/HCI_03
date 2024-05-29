import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hci_03/screens/battle/battle_screen.dart';
import 'package:hci_03/screens/calendar/calendar_screen.dart';
import 'package:hci_03/screens/myfriend/myfriend_screen.dart';
import 'package:hci_03/screens/mypage/mypage_screen.dart';
import 'package:hci_03/screens/battle/no_battle_opponent_screen.dart';
import '../controllers/battle_controller.dart';
import '../controllers/user_controller.dart';
import 'battle_accept/battle_accept_screen1.dart';


class MainScreens extends StatefulWidget {
  MainScreens({super.key});

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _selectedIndex = 0;
  final BattleController battleController = Get.put(BattleController());
  final UserController userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    battleController.fetchBattle(userController.user.value.memberId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(() {
        if (battleController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return IndexedStack(
            index: _selectedIndex,
            children: [
              _getBattleScreen(),
              CalendarScreen(),
              FriendScreen(),
              MyPageScreen(),
            ],
          );
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: '대결상황',
            icon: Icon(FontAwesomeIcons.flag),
          ),
          BottomNavigationBarItem(
            label: '캘린더',
            icon: Icon(Icons.calendar_month),
          ),
          BottomNavigationBarItem(
            label: '친구',
            icon: Icon(Icons.people),
          ),
          BottomNavigationBarItem(
            label: '마이페이지',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }

  Widget _getBattleScreen() {
    var battle = battleController.battle.value;
    var memberId = userController.user.value.memberId;

    if (battle.battleNo > 0) {
      if (battle.challengee == memberId && !battle.accept) {
        return BattleAcceptScreen1();
      } else {
        return BattleScreen(battle: battle);
      }
    } else {
      return NoBattleOpponentScreen(message: "현재 대결 상대가 없습니다.");
    }
  }
}

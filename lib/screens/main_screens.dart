import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hci_03/screens/auth/login_screen.dart';
import 'package:hci_03/screens/auth/signup_screen.dart';
import 'package:hci_03/screens/battle/battle_screen.dart';
import 'package:hci_03/screens/calendar/calendar_screen.dart';
import '../controllers/battle_controller.dart';
import '../controllers/user_controller.dart';
import 'myfriend/myfriend_screen.dart';
import 'mypage/mypage_screen.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

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
      body:
      IndexedStack(
        index: _selectedIndex,
        children: [
          // 캘린더, 대결상황(홈), 친구, 마이페이지
          BattleScreen(battle: battleController.battle.value),
          CalendarScreen(),
          FriendScreen(),
          MyPageScreen(),
        ],
      ),

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
          BottomNavigationBarItem(label: '대결상황', icon: Icon(
            FontAwesomeIcons.flag,
          )),
          BottomNavigationBarItem(label: '캘린더', icon: Icon(
            Icons.calendar_month,
          )),
          BottomNavigationBarItem(label: '친구', icon: Icon(
            Icons.people,
          )),
          BottomNavigationBarItem(label: '마이페이지', icon: Icon(
            Icons.person,
          )),
        ],
      ),
    );
  }
}

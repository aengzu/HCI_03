import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'battle/battle_screen.dart';
import 'calendar/calendar_screen.dart';
import 'myfriend/myfriend_screen.dart';
import 'mypage/mypage_screen.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // 캘린더, 대결상황(홈), 친구, 마이페이지
          const CalendarScreen(),
          BattleScreen(),
          const FriendScreen(),
          // MyPageScreen(),
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
          BottomNavigationBarItem(
              label: '캘린더',
              icon: Icon(
                Icons.calendar_month,
              )),
          BottomNavigationBarItem(
              label: '대결상황', icon: Icon(FontAwesomeIcons.flag)),
          BottomNavigationBarItem(
              label: '친구',
              icon: Icon(
                Icons.people,
              )),
          BottomNavigationBarItem(
              label: '마이페이지',
              icon: Icon(
                Icons.person,
              )),
        ],
      ),
    );
  }
}

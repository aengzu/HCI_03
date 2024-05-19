import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hci_03/constants/theme.dart'; // textTheme import
import '../../constants/image_assets.dart';
import '../components/appbar_preffered_size.dart';
import 'package:hci_03/models/request_title.dart';
import 'package:hci_03/screens/battle/components/promise_widget.dart'; // PromiseWidget import
import 'package:hci_03/screens/calendar/dummy.dart'; // dummy.dart import

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
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
            const PromiseWidget(), // 상단에 PromiseWidget 추가
            SizedBox(
              height: screenHeight*0.015,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TableCalendar(
                  rowHeight: screenHeight*0.067,
                  headerStyle: HeaderStyle(headerMargin: EdgeInsets.symmetric(vertical: 10.0),titleCentered: true, titleTextStyle: textTheme().titleSmall!),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarFormat: CalendarFormat.month, // 월간 보기로 제한
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Month'
                  },
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: textTheme().bodySmall!, // 평일 글꼴 스타일
                    weekendStyle: textTheme().bodySmall!.copyWith(color: Colors.red), // 주말 글꼴 스타일
                  ),
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, day, focusedDay) {
                      if (day.isBefore(DateTime.now())) { // 과거 날짜 스타일
                        return Container(
                          margin: const EdgeInsets.all(5.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: _getDayColor(day), // 날짜에 따른 색상 지정
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${day.day}',
                            style: textTheme().bodySmall?.copyWith(color: Colors.black) ?? TextStyle(color: Colors.black), // 글씨색 검정색
                          ),
                        );
                      } else if (isSameDay(day, DateTime.now())) { // 오늘 날짜 스타일
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${day.day}',
                            style: textTheme().bodySmall!, // 글씨색 검정색
                          ),
                        );
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 날짜에 따라 색상을 반환하는 함수
  Color _getDayColor(DateTime day) {
    DateTime dateWithoutTime = DateTime.utc(day.year, day.month, day.day);
    if (battleResults.containsKey(dateWithoutTime)) {
      if (battleResults[dateWithoutTime] == 'A') {
        return Color(0x80FFF73B); // 노란색, 50% 투명도
      } else if (battleResults[dateWithoutTime] == 'B') {
        return Color(0x804CD663); // 초록색, 50% 투명도
      }
    }
    return Colors.grey.withOpacity(0.5); // 기본 색상, 50% 투명도
  }
}

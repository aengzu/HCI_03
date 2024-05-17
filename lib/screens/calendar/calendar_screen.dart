import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/screens/components/custom_btn.dart'; // Import the CustomButton
import '../../constants/image_assets.dart';
import 'package:hci_03/screens/components/notice_box.dart';
import 'package:hci_03/screens/components/custom_light_btn.dart';
import '../components/appbar_preffered_size.dart';
import 'package:hci_03/screens/battle/battle_screen.dart'; // Import the BattleScreen
import 'package:hci_03/models/request_title.dart';


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
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(ImageAssets.logo, width: 100),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Define your settings action here
            },
          ),
        ],
        bottom: appBarBottomLine(),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20), // 박스를 아래로 내리기 위해 추가
          NoticeBox(notice: dummyNotices[4]),// Replace the notice box
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TableCalendar(
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
                calendarFormat: CalendarFormat.month,
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Month'
                }, // Restricting to month view only
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(fontSize: 12), // Adjust font size if necessary
                  weekendStyle: TextStyle(fontSize: 12, color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

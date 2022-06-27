import 'package:capstone/Calendar/SelectedDayPage.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../api/Config.dart';
import '../api/HttpController.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CalendarStatePage();
}

class _CalendarStatePage extends State<CalendarPage> {
  HttpController _httpController = HttpController();
  DateTime now = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  final String url = Config.baseURL + '/api/calendar/month';

  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: AppBar(
                backgroundColor: Color(0xFF007F4A),
                automaticallyImplyLeading: true,
                title: const Center(
                    child: Text(
                  "캘린더\t\t\t\t\t\t\t\t\t\t",
                  style: TextStyle(fontSize: 22.0),
                )),
              ),
            ),
            body:
              TableCalendar(
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  titleTextStyle: const TextStyle(fontSize: 17.0),
                  headerMargin: EdgeInsets.only(top: 30, bottom: 30),
                ),
                firstDay: DateTime.utc(1970, 1, 1),
                focusedDay: _focusedDay,
                lastDay: DateTime.utc(now.year, 12, 31),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SelectedDayPage(today: _focusedDay)
                  )
                  );
                },
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: const TextStyle(color: Color(0xFF061882)),
                  weekendStyle: const TextStyle(color: Color(0xFFC20810))
                ),
                calendarFormat: _calendarFormat,
              ),
            );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rate_my_bistro/theme/ThemeData.dart';

class MenuDateBar extends StatefulWidget {
  @override
  _MenuDateBarState createState() => _MenuDateBarState();
}

class _MenuDateBarState extends State<MenuDateBar> {
  static int calculateWeekNumber(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    return ((dayOfYear - date.weekday + 10) / 7).floor();
  }

  int currentWeek = calculateWeekNumber(DateTime.now());
  DateTime shownDate = DateTime.now();

  void onNextDay() {
    setState(() {
      shownDate = shownDate.add(Duration(days: 7));
    });
  }

  void onPreviousDay() {
    setState(() {
      shownDate = shownDate.subtract(Duration(days: 7));
    });
  }

  int get shownWeek {
    return calculateWeekNumber(shownDate);
  }

  String get dateDescriptor {
    final firstDayOfTheWeek = shownDate.subtract(new Duration(days: shownDate.weekday));
    final lastDayOfTheWeek = shownDate.add(new Duration(days: 7 - shownDate.weekday));
    String firstDate = firstDayOfTheWeek.day.toString() + "." + firstDayOfTheWeek.month.toString();
    String lastDate = lastDayOfTheWeek.day.toString() + "." + lastDayOfTheWeek.month.toString();

    return firstDate + " - " + lastDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
//      color: Colors.transparent,
      height: 45.0,
      child: BottomAppBar(
        elevation: 1.5,
        color: bistroTheme.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.chevron_left, color: Colors.white),
              onPressed: onPreviousDay,
            ),
            Text(dateDescriptor, style: bistroTheme.appBarTheme.textTheme.body1,),
            IconButton(
              icon: Icon(Icons.chevron_right, color: Colors.white),
              onPressed: onNextDay,
            )
          ],
        ),
      ),
    );
  }
}
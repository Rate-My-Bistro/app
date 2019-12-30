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
    final diff = shownWeek - currentWeek;

    switch (diff) {
      case 1:
        return 'Next Week';
      case 0:
        return 'This Week';
      case -1:
        return 'Last Week';
      default:
        return 'Week ' + shownWeek.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      color: Color.fromRGBO(255, 255, 255, 0.8),
      height: 40.0,
      child: BottomAppBar(
        elevation: 1.5,
        color: Colors.transparent,
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
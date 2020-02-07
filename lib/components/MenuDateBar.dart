import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rate_my_bistro/theme/ThemeData.dart';

/// Component that displays the dates
/// of a given week
///
/// Allows to switch between weeks
///
/// Todo: Refactoring
///  1. Add Redux
///  2. Use Days instead of weeks
///
/// @author Ansgar Sachs <ansgar.sachs@cgm.com>
///
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
    final firstDayOfTheWeek =
        shownDate.subtract(new Duration(days: shownDate.weekday));
    final lastDayOfTheWeek =
        shownDate.add(new Duration(days: 7 - shownDate.weekday));
    String firstDate = firstDayOfTheWeek.day.toString() +
        "." +
        firstDayOfTheWeek.month.toString();
    String lastDate = lastDayOfTheWeek.day.toString() +
        "." +
        lastDayOfTheWeek.month.toString();

    return firstDate + " - " + lastDate;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Material(
                color: Colors.white10,
                shape: BeveledRectangleBorder(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(25.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.chevron_left,
                          color: BistroDesign.theme.primaryColor),
                      onPressed: onPreviousDay,
                    ),
                    Text(
                      dateDescriptor,
                      style: BistroDesign.theme.textTheme.title
                          .apply(color: BistroDesign.theme.primaryColor),
                    ),
                    IconButton(
                      icon: Icon(Icons.chevron_right,
                          color: BistroDesign.theme.primaryColor),
                      onPressed: onNextDay,
                    )
                  ],
                ))));
  }
}

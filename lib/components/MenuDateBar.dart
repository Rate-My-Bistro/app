import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rate_my_bistro/theme/ThemeData.dart';
import 'package:rate_my_bistro/utils/DateUtils.dart';

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
class MenuDateBar extends StatelessWidget {
  final DateTime selectedMenuDay;
  final Function onMenuDaySelect;

  const MenuDateBar({
      this.selectedMenuDay,
      this.onMenuDaySelect,
  });

  void onNextDay() => this.onMenuDaySelect(selectedMenuDay.add(Duration(days: 1)));
  void onPreviousDay() => this.onMenuDaySelect(selectedMenuDay.subtract(Duration(days: 1)));

  String get dateDescriptor {
    if (DateUtils.isSameDay(this.selectedMenuDay, DateUtils.getToday())) {
      return "Heute";
    }

    if (DateUtils.isSameDay(this.selectedMenuDay, DateUtils.getTomorrow())) {
      return "Morgen";
    }

    if (DateUtils.isSameDay(this.selectedMenuDay, DateUtils.getYesterday())) {
      return "Gestern";
    }

    return new DateFormat("d. MMMM").format(this.selectedMenuDay);
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

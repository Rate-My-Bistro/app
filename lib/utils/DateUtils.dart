class DateUtils {
  static getToday() => DateTime.now();
  static getTomorrow() => getDaysInFuture(1);
  static getYesterday() => getDaysInPast(1);
  static getDaysInFuture(int days) => DateTime.now().add(Duration(days: days));
  static getDaysInPast(int days) => DateTime.now().subtract(Duration(days: days));

  static isSameDay(DateTime a, DateTime b) => a.year == b.year && a.month == b.month && a.day == b.day;
}
